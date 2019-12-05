function PageHTMLBar(Name, PageCount, CurrPage, Url, ListLength) {
    this.Name = Name;
    this.PageCount = PageCount;
    this.CurrPage = CurrPage;
    this.Url = Url;
    this.ListLength = ListLength ? ListLength : 10;
    if (this.PageCount <= 0) {
        this.PageCount = 1;
    }
    if (this.CurrPage > this.PageCount) {
        this.CurrPage = this.PageCount;
    }
}
PageHTMLBar.prototype.Change = function(PageNum) {
	 	var  form = document.forms.listform;
	 	$("#pageNum").val(PageNum);
	 	form.action = this.Url;
        form.submit();
}
PageHTMLBar.prototype.ChangeTo = function() {
  //  var CurrPage = prompt("请输入跳转到的页号", $("#goPage").val());
  if($("#goPage").val()==""){
  	alert("请输入跳转到的页号");
  	return false;
  }
  var CurrPage = $("#goPage").val();
    if (CurrPage) {
        if (CurrPage <= this.PageCount && CurrPage >= 1) {
            this.Change(CurrPage);
        }
    }
}
PageHTMLBar.prototype.toString = function() {
    var PageHtml = '',pStart = pEnd = 1;
    if (this.PageCount <= 1) {
        pStart = pEnd = 1;
       
    } else {
        if (this.PageCount <= this.ListLength) {
            pStart = 1;
            pEnd = this.PageCount;
        } else {
            var movestep = Math.round(this.ListLength / 2);
            if (this.CurrPage > movestep) {
                pStart = this.CurrPage - movestep;
                pEnd = this.CurrPage + movestep;
                if (pEnd > this.PageCount) {
                    pStart -= pEnd - this.PageCount;
                    pEnd = this.PageCount;
                }
                if (pEnd > this.PageCount) {
                    pEnd = this.PageCount;
                    pStart -= (pEnd - this.PageCount);
                }
            } else {
                pStart = 1;
                pEnd = this.ListLength;
            }
        }
    }
	PageHtml='<div class="paginations"><ul>';
  
    if (this.CurrPage == 1) {
    	PageHtml = PageHtml + '<li class="disabled border_page_noright">首页</li>';
        PageHtml = PageHtml + '<li class="disabled border_page_noright">上页</li>';
    } else {
    	PageHtml = PageHtml + '<a href="javascript:' + this.Name + '.Change(1)"><li class="hand border_page_noright">首页</li></a>';
        PageHtml = PageHtml + '<a href="javascript:' + this.Name + '.Change(' + ((this.CurrPage - 1) <= 1 ? 1 : (this.CurrPage - 1)) + ')"><li class="hand renwu_content_bottom_right_a border_page_noright">上页</li></a>';
   	}
/*    if(this.PageCount <= 1){
    	PageHtml = PageHtml + '<li><input type="text"   id="goPage" name="goPage" value="'+this.CurrPage+'"/></li><li class="hand">Go</li>';
    }else{
    	PageHtml = PageHtml + '<li><input  type="text"  id="goPage" name="goPage" value="'+this.CurrPage+'"/></li><a href="javascript:' + this.Name + '.ChangeTo()"><li class="hand">Go</li></a>';
    }*/
   for (var NumID = pStart; NumID <= pEnd; NumID++) {
        if (NumID == this.CurrPage) {
            PageHtml += '<a href="javascript:void(0)" class="act pagenum"><li class="hand border_page_noright">'+NumID+'</li></a>';
        } else {
            PageHtml += '<a href="javascript:' + this.Name + '.Change(' + NumID + ')"><li class="hand border_page_noright">' + NumID + '</li></a>';
        }
    }

    if (this.CurrPage == this.PageCount) {
        PageHtml = PageHtml + '<li class="disabled border_page_noright">下页</li>';
        PageHtml = PageHtml + '<li class="disabled border_page">尾页</li>';
    } else {
        PageHtml = PageHtml + '<a href="javascript:' + this.Name + '.Change(' + ((this.CurrPage + 1) >= this.PageCount ? this.PageCount : (this.CurrPage + 1)) + ')"><li class="hand border_page_noright">下页</li></a>';
   		PageHtml = PageHtml + '<a href="javascript:' + this.Name + '.Change(' + this.PageCount + ')"><li class="hand border_page">尾页</li></a>';
    }
	PageHtml = PageHtml + '</ul></div>';
    return PageHtml;
}