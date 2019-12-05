/**
 * XUtile.js
 * ========通用js
 * @author zyp
 * @data   2018.12.10
 */
'use strict';
var XUtils = {
	version : '1.0.0',
	
	apply : function( a, b ) {
		if ( a && b ) {
			for ( var i in b )
				a[i] = b[i]
		}
		return a;
	}
};

(function( $ ) {
	var toString = Object.prototype.toString;
	
	XUtils.apply( XUtils, {
		// 是否为空
        isEmpty : function( v ){
            return v === null || v === undefined || v === '' || ( XUtils.isArray( v ) && ! v.length );
        },

		// 是否是数组
		isArray : function( v ) {
	        return toString.apply( v ) === '[object Array]';
	    },
	    
	    // 是否是日期
	    isDate : function( v ) {
	        return toString.apply( v ) === '[object Date]';
	    },
	    
	    // 是否是对象
	    isObject : function( v ){
            return !!v && toString.call( v ) === '[object Object]';
        },
        
	    // 是否是函数
	    isFunction : function( v ){
	        return toString.apply( v ) === '[object Function]';
	    },

        // 是否是数值
        isNumber : function( v ){
            return typeof v === 'number' && isFinite( v );
        },

        // 是否是字符串
        isString : function( v ){
            return typeof v === 'string';
        },

        // 是否是布尔值
        isBoolean : function( v ){
            return typeof v === 'boolean';
        },

        // 是否已经定义
        isDefined : function( v ) {
            return typeof v !== 'undefined';
        },
        
        // 创建新的数组
	    toArray : function( a, i, j ) {
	    	return Array.prototype.slice.call( a, i || 0, j || a.length );
        },
        
        // 表格行号bootstrapTable
		formatNumber : function( value, row, index ) {
	    	return index + 1;
	    },
	    
	    // 格式日期成 年月日bootstrapTable
	    formatToDate : function( value, row, index ) {
	    	if ( XUtils.isEmpty( value ) )
	    		return;
	    	return value.substring( 0, 10 );
	    },
	    
	    // 只保留时间 时分秒bootstrapTable
	    formatToTime : function( value, row, index ) {
	    	if ( XUtils.isEmpty( value ) )
	    		return;
	    	return value.substring( 11 );
	    },
	    
	    // 表格行号dataTable
	    sortNum : 1,
	    formatNumber : function( tableId ) {
	    	var	info =  $( '#' + tableId ).DataTable().page.info();
	    	if ( info.start > XUtils.sortNum || XUtils.sortNum > info.end ) { 
	    		XUtils.sortNum = info.start + 1 
	    	};
	    	return XUtils.sortNum++;
	    },
	    
	    // 格式日期成 年月日dataTable
	    formatToDate : function( data, type, row, meta ) {
	    	if ( XUtils.isEmpty( data ) )
	    		return;
	    	return data.substring( 0, 10 );
	    },
	    
	    // 只保留时间 时分秒bootstrapTable
	    formatToTime : function( data, type, row, meta ) {
	    	if ( XUtils.isEmpty( data ) )
	    		return;
	    	return data.substring( 11 );
	    },
	    
	    format : function( format ){
	        var args = Haotel.toArray( arguments, 1 );
	        return format.replace( /\{(\d+)\}/g, function( m, i ) {
	            return args[i];
	        });
	    },
	    
	    // 初始化下拉框
	    select2 : function( o ) {
	    	// 设置下拉框名称
			if ( ! XUtils.isEmpty( o.id ) ) {
				o.selectId = '#' + o.id;
			} else if ( ! XUtils.isEmpty( o.name ) ) {
				o.selectId = 'select[name="' + o.name + '"]';
			}
			// 构建Ajax
			if ( ! XUtils.isEmpty( o.url ) ) {
				o.ajax = {
					cache: o.cache || true, 
					type: o.method || 'POST', 
					dataType: o.dataType || 'json', 
					delay: o.delay || 500, 
					url: o.url, // 搜索地址
					data: function ( params ) { 
						$.extend( params, o.params || {} );
						params.limit = params.limit || 10;  // 分页
						params.start = ( ( params.page || 1 ) - 1 ) * params.limit;
						params[ params._key || '_key' ] = params.term || ''; // 搜索条件
						return params;
					}, 
					processResults: function ( data, params ) {
						params.page = params.page || 1;
						params.limit = params.limit || 10;
						if ( typeof data !== 'undefined' ) 
							data = data || {};
							
						var _results = [], _text, _value,
							_existKey = ( params._key || '' ).indexOf( '.' ) !== -1,
							_existValue = ( params._value || '' ).indexOf( '.' ) !== -1;
						$.each( data.list || [], function( i, d ) {
							_text = _existKey ? eval( 'd.' + params._key ) : d[params._key || 'text'];
							_value = _existValue ? eval( 'd.' + params._value ) : d[params._value || 'id'];
							_results.push({ id: _value, text: _text, data: d });
						});
						
						return {
							results: _results,
							pagination: {
								more: ( params.page * params.limit ) < ( data.total || 0 )
							}
						};
					}
				}
			}
			// 构建Select2
			return $( o.selectId ).select2({
				ajax: o.ajax || null,
				theme: o.theme || 'default',		// 主题
				placeholderOption: o.placeholderOption || 'first', 
				allowClear: o.allowClear || false,// 不允许清除
				closeOnSelect: o.closeOnSelect || true,// 选中后关闭
				containerCssClass: o.containerCssClass || '',// 内容的样式
				data: o.data || null,// 数据
				debug: o.debug || false,// 调试
				disabled: o.disabled || false,// 是否禁用
				dropdownAutoWidth: o.dropdownAutoWidth || false,// 下拉自动宽度
				dropdownCssClass: o.dropdownCssClass || '',// 下拉样式
				language: "zh-CN",// 语言
				maximumInputLength: o.maximumInputLength || 0,// 最大输入长度
				maximumSelectionLength: o.maximumSelectionLength || 0,// 最大选择长度
				minimumInputLength: o.minimumInputLength || 0,// 最小输入长度
				minimumResultsForSearch: o.minimumResultsForSearch || 0,// 最小查询结果数量,去除搜索框Infinity
				multiple: o.multiple || false,// 是否允许多选
				placeholder: o.placeholder || '请选择',// 提示
				selectOnClose: o.selectOnClose || false,// 是否关闭后选中
				tags: o.tags || false,
				width: o.width || '100%'// 宽度
			});
		}
	});
	
	/**
	 * 赋值 Select2 下拉框<select2>
	 * @param lean1 是否添加selected属性
	 * @param lean2 是否实际选择
	 */
	$.fn.valueSelete2 = function( o ) {
		return this.each( function() {
			var el = $(this);
			var _lean1 = o.lean1 || true,
				_lean2 = o.lean2 || true;
			var newOption = new Option( o.text, o.id, _lean1, _lean2 );
			
			el.append(newOption).trigger('change');
		});
	}
	
	/**
	 * 重置清空 Select2 下拉框<select2>
	 * @param Clearing the value of a form form
	 */
	$.fn.resetSelect2 = function() {
		return this.each( function() {
			var el = $(this);
			var tag = this.tagName;
			
			switch( tag ) {
			case 'SELECT':
				el.val( null ).trigger( 'change' );
			
			case 'FORM' :
				el.find( 'select' ).each( function() {
					$( this ).val( null ).trigger( 'change' );
				});
			}
		});
	}
})(jQuery);
/**
 * XUtile.js
 * ========通用js
 * @author zyp
 * @data   2018.12.10
 */
'use strict';
var XUtils = {
	version : '1.0.0',
	
	apply : function( a, b ) {
		if ( a && b ) {
			for ( var i in b )
				a[i] = b[i]
		}
		return a;
	}
};

(function( $ ) {
	var toString = Object.prototype.toString;
	
	XUtils.apply( XUtils, {
		// 是否为空
        isEmpty : function( v ){
            return v === null || v === undefined || v === '' || ( XUtils.isArray( v ) && ! v.length );
        },

		// 是否是数组
		isArray : function( v ) {
	        return toString.apply( v ) === '[object Array]';
	    },
	    
	    // 是否是日期
	    isDate : function( v ) {
	        return toString.apply( v ) === '[object Date]';
	    },
	    
	    // 是否是对象
	    isObject : function( v ){
            return !!v && toString.call( v ) === '[object Object]';
        },
        
	    // 是否是函数
	    isFunction : function( v ){
	        return toString.apply( v ) === '[object Function]';
	    },

        // 是否是数值
        isNumber : function( v ){
            return typeof v === 'number' && isFinite( v );
        },

        // 是否是字符串
        isString : function( v ){
            return typeof v === 'string';
        },

        // 是否是布尔值
        isBoolean : function( v ){
            return typeof v === 'boolean';
        },

        // 是否已经定义
        isDefined : function( v ) {
            return typeof v !== 'undefined';
        },
        
        // 表格行号bootstrapTable
		formatNumber : function( value, row, index ) {
	    	return index + 1;
	    },
	    
	    // 格式日期成 年月日bootstrapTable
	    formatToDate : function( value, row, index ) {
	    	if ( XUtils.isEmpty( value ) )
	    		return;
	    	return value.substring( 0, 10 );
	    },
	    
	    // 只保留时间 时分秒bootstrapTable
	    formatToTime : function( value, row, index ) {
	    	if ( XUtils.isEmpty( value ) )
	    		return;
	    	return value.substring( 11 );
	    },
	    
	    // 表格行号dataTable
	    sortNum : 1,
	    formatNumber : function( tableId ) {
	    	var	info =  $( '#' + tableId ).DataTable().page.info();
	    	if ( info.start > XUtils.sortNum || XUtils.sortNum > info.end ) { 
	    		XUtils.sortNum = info.start + 1 
	    	};
	    	return XUtils.sortNum++;
	    },
	    
	    // 格式日期成 时间戳转换年月日dataTable
	    formatToDate : function( data, type, row, meta ) {
	    	if ( XUtils.isEmpty( data ) )
	    		return nvlStr(data);
	    	var date = new Date( data );
	    	var m = "0" + (date.getMonth() + 1);
	    	var d = "0" + date.getDate();
	    	return nvlStr(date.getFullYear() 
	    			+ "-" + m.substring(m.length-2, m.length) 
	    			+ "-" + d.substring(d.length-2, d.length));
	    },
	    
	    // 只保留时间 时分秒bootstrapTable
	    formatToTime : function( data, type, row, meta ) {
	    	if ( XUtils.isEmpty( data ) )
	    		return;
	    	return data.substring( 11 );
	    },
	    
	    // 通用返回格式化
		formatToData: function( data, type, row, meta ) {
			return nvlStr(data);
		},
	    
	    /**
	     * select2初始化方法
	     * 基本远程初始化方法XUtils.select2({ id: id, url: url, params: { 
	     * _key: '搜索条件也是下拉字段' , _value: id, 可继续增加搜索条件 } });
	     * 远程数据源支持[{id, value}, {id, value}]格式，并分页
	     * 默认数据源
	     * XUtils.select2({ id: id, data: [{ id, value }, { id, value }] });
	     */
	    select2 : function( o ) {
	    	// 设置下拉框名称
			if ( ! XUtils.isEmpty( o.id ) ) {
				o.selectId = '#' + o.id;
			} else if ( ! XUtils.isEmpty( o.name ) ) {
				o.selectId = 'select[name="' + o.name + '"]';
			}
			// 构建Ajax
			if ( ! XUtils.isEmpty( o.url ) ) {
				o.ajax = {
					cache: o.cache || true, 
					type: o.method || 'POST', 
					dataType: o.dataType || 'json', 
					delay: o.delay || 500, 
					url: o.url, // 搜索地址
					data: function ( params ) { 
						$.extend( params, o.params || {} );
						params.limit = params.limit || 10;  // 分页
						params.start = ( ( params.page || 1 ) - 1 ) * params.limit;
						params[ params._key || '_key' ] = params.term || ''; // 搜索条件
						return params;
					}, 
					processResults: function ( data, params ) {
						params.page = params.page || 1;
						params.limit = params.limit || 10;
						if ( typeof data !== 'undefined' ) 
							data = data || {};
							
						var _results = [], _text, _value,
							_existKey = ( params._key || '' ).indexOf( '.' ) !== -1,
							_existValue = ( params._value || '' ).indexOf( '.' ) !== -1;
						$.each( data.list || [], function( i, d ) {
							_text = _existKey ? eval( 'd.' + params._key ) : d[params._key || 'text'];
							_value = _existValue ? eval( 'd.' + params._value ) : d[params._value || 'id'];
							_results.push({ id: _value, text: _text, data: d });
						});
						
						return {
							results: _results,
							pagination: {
								more: ( params.page * params.limit ) < ( data.total || 0 )
							}
						};
					}
				}
			}
			if ( ! XUtils.isEmpty( o.language ) ) {
				var a = {}, b = o.language;
				a.errorLoading = function() {return b.errorLoading || "无法载入结果。";};
				a.inputTooLong = function(e) {
					var t=e.input.length-e.maximum,
					n="请删除"+t+"个字符";
					return b.inputTooLong || n;
				};
				a.inputTooShort = function(e) {
					var t=e.minimum-e.input.length,
					n="请再输入至少"+t+"个字符";
					return b.inputTooShort || n;
				};
				a.loadingMore = function() { return b.loadingMore || "载入更多结果…"; };
				a.maximumSelected = function(e) {
					var t="最多只能选择"+e.maximum+"个项目";
					return b.maximumSelected || t;
				};
				a.noResults = function() {return b.noResults || "未找到结果";};
				a.searching = function() {return b.searching || "搜索中…";};
				o.language = a;
			}
			// 构建Select2
			return $( o.selectId ).select2({
				ajax: o.ajax || null,
				theme: o.theme || 'default',		// 主题
				placeholderOption: o.placeholderOption || 'first', 
				allowClear: o.allowClear || false,// 不允许清除
				closeOnSelect: o.closeOnSelect || true,// 选中后关闭
				containerCssClass: o.containerCssClass || '',// 内容的样式
				data: o.data || null,// 数据
				debug: o.debug || false,// 调试
				disabled: o.disabled || false,// 是否禁用
				dropdownAutoWidth: o.dropdownAutoWidth || false,// 下拉自动宽度
				dropdownCssClass: o.dropdownCssClass || '',// 下拉样式
				language: o.language || "zh-CN",// 语言
				maximumInputLength: o.maximumInputLength || 0,// 最大输入长度
				maximumSelectionLength: o.maximumSelectionLength || 0,// 最大选择长度
				minimumInputLength: o.minimumInputLength || 0,// 最小输入长度
				minimumResultsForSearch: o.minimumResultsForSearch || 0,// 最小查询结果数量,去除搜索框Infinity
				multiple: o.multiple || false,// 是否允许多选
				placeholder: o.placeholder || '请选择',// 提示
				selectOnClose: o.selectOnClose || false,// 是否关闭后选中
				tags: o.tags || false,
				width: o.width || '100%'// 宽度
			});
		}
	});
	
	/**
	 * 赋值 Select2 下拉框<select2>
	 * @param lean1 是否添加selected属性
	 * @param lean2 是否实际选择
	 * 列子：$( '#id' ).valSelect2({ id: id, text: text }); 默认选中
	 * $( '#id' ).valSelect2({ id: id, text: text, false, false }); 创建不选中
	 */
	$.fn.valSelect2 = function( o ) {
		return this.each( function() {
			var el = $(this);
			var _lean1 = o.lean1 || true,
				_lean2 = o.lean2 || true;
			var newOption = new Option( o.text, o.id, _lean1, _lean2 );
			
			el.append(newOption).trigger('change');
		});
	}
	
	/**
	 * 重置清空 Select2 下拉框<select2>
	 * @param Clearing the value of a form form
	 * 例子：$( '#selectId' ).resetSelect2(); 清空下拉框
	 * $( '#formId' ).resetSelect2(); 清空表单内下拉框
	 */
	$.fn.resetSelect2 = function() {
		return this.each( function() {
			var el = $(this);
			var tag = this.tagName;
			
			switch( tag ) {
			case 'SELECT':
				el.val( null ).trigger( 'change' );
			
			case 'FORM' :
				el.find( 'select' ).each( function() {
					$( this ).val( null ).trigger( 'change' );
				});
			}
		});
	},
	
	/**
	 * formToArray() gathers form element data into an array of objects that can
	 * be passed to any of the following ajax functions: $.get, $.post, or load.
	 * Each object in the array has both a 'name' and 'value' property.  An example of
	 * an array for a simple login form might be:
	 *
	 * [ { name: 'username', value: 'jresig' }, { name: 'password', value: 'secret' } ]
	 *
	 * It is this array that is passed to pre-submit callback functions provided to the
	 * ajaxSubmit() and ajaxForm() methods.
	 */
	$.fn.formToArray = function(semantic, elements) {
	    var a = [];
	    if (this.length === 0) {
	        return a;
	    }
	    
	    var feature = {};
	    feature.fileapi = $("<input type='file'/>").get(0).files !== undefined;
	    feature.formdata = window.FormData !== undefined;
	    
	    var form = this[0];
	    var formId = this.attr('id');
	    var els = semantic ? form.getElementsByTagName('*') : form.elements;
	    var els2;

	    if (els && !/MSIE [678]/.test(navigator.userAgent)) { // #390
	        els = $(els).get();  // convert to standard array
	    }

	    // #386; account for inputs outside the form which use the 'form' attribute
	    if ( formId ) {
	        els2 = $(':input[form="' + formId + '"]').get(); // hat tip @thet
	        if ( els2.length ) {
	            els = (els || []).concat(els2);
	        }
	    }

	    if (!els || !els.length) {
	        return a;
	    }

	    var i,j,n,v,el,max,jmax;
	    for(i=0, max=els.length; i < max; i++) {
	        el = els[i];
	        n = el.name;
	        if (!n || el.disabled) {
	            continue;
	        }

	        if (semantic && form.clk && el.type == "image") {
	            // handle image inputs on the fly when semantic == true
	            if(form.clk == el) {
	                a.push({name: n, value: $(el).val(), type: el.type });
	                a.push({name: n+'.x', value: form.clk_x}, {name: n+'.y', value: form.clk_y});
	            }
	            continue;
	        }

	        v = $.fieldValue(el, true);
	        if (v && v.constructor == Array) {
	            if (elements) {
	                elements.push(el);
	            }
	            for(j=0, jmax=v.length; j < jmax; j++) {
	                a.push({name: n, value: v[j]});
	            }
	        }
	        else if (feature.fileapi && el.type == 'file') {
	            if (elements) {
	                elements.push(el);
	            }
	            var files = el.files;
	            if (files.length) {
	                for (j=0; j < files.length; j++) {
	                    a.push({name: n, value: files[j], type: el.type});
	                }
	            }
	            else {
	                // #180
	                a.push({ name: n, value: '', type: el.type });
	            }
	        }
	        else if (v !== null && typeof v != 'undefined') {
	            if (elements) {
	                elements.push(el);
	            }
	            a.push({name: n, value: v, type: el.type, required: el.required});
	        }
	    }

	    if (!semantic && form.clk) {
	        // input type=='image' are not found in elements array! handle it here
	        var $input = $(form.clk), input = $input[0];
	        n = input.name;
	        if (n && !input.disabled && input.type == 'image') {
	            a.push({name: n, value: $input.val()});
	            a.push({name: n+'.x', value: form.clk_x}, {name: n+'.y', value: form.clk_y});
	        }
	    }
	    return a;
	},
	
	/**
	 * ajaxForm() provides a mechanism for fully automating form submission.
	 *
	 * The advantages of using this method instead of ajaxSubmit() are:
	 *
	 * 1: This method will include coordinates for <input type="image" /> elements (if the element
	 *    is used to submit the form).
	 * 2. This method will include the submit element's name/value data (for the element that was
	 *    used to submit the form).
	 * 3. This method binds the submit() method to the form for you.
	 *
	 * The options argument for ajaxForm works exactly as it does for ajaxSubmit.  ajaxForm merely
	 * passes the options argument along after properly binding events for submit elements and
	 * the form itself.
	 */
	$.fn.ajaxForm = function(options) {
	    options = options || {};
	    options.delegation = options.delegation && $.isFunction($.fn.on);

	    // in jQuery 1.3+ we can fix mistakes with the ready state
	    if (!options.delegation && this.length === 0) {
	        var o = { s: this.selector, c: this.context };
	        if (!$.isReady && o.s) {
	            log('DOM not ready, queuing ajaxForm');
	            $(function() {
	                $(o.s,o.c).ajaxForm(options);
	            });
	            return this;
	        }
	        // is your DOM ready?  http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
	        log('terminating; zero elements found by selector' + ($.isReady ? '' : ' (DOM not ready)'));
	        return this;
	    }

	    if ( options.delegation ) {
	        $(document)
	            .off('submit.form-plugin', this.selector, doAjaxSubmit)
	            .off('click.form-plugin', this.selector, captureSubmittingElement)
	            .on('submit.form-plugin', this.selector, options, doAjaxSubmit)
	            .on('click.form-plugin', this.selector, options, captureSubmittingElement);
	        return this;
	    }

	    // private event handlers
	    function doAjaxSubmit(e) {
	        /*jshint validthis:true */
	        var options = e.data;
	        if (!e.isDefaultPrevented()) { // if event has been canceled, don't proceed
	            e.preventDefault();
	            $(e.target).ajaxSubmit(options); // #365
	        }
	    }
	    
	    function captureSubmittingElement(e) {
	        /*jshint validthis:true */
	        var target = e.target;
	        var $el = $(target);
	        if (!($el.is("[type=submit],[type=image]"))) {
	            // is this a child element of the submit el?  (ex: a span within a button)
	            var t = $el.closest('[type=submit]');
	            if (t.length === 0) {
	                return;
	            }
	            target = t[0];
	        }
	        var form = this;
	        form.clk = target;
	        if (target.type == 'image') {
	            if (e.offsetX !== undefined) {
	                form.clk_x = e.offsetX;
	                form.clk_y = e.offsetY;
	            } else if (typeof $.fn.offset == 'function') {
	                var offset = $el.offset();
	                form.clk_x = e.pageX - offset.left;
	                form.clk_y = e.pageY - offset.top;
	            } else {
	                form.clk_x = e.pageX - target.offsetLeft;
	                form.clk_y = e.pageY - target.offsetTop;
	            }
	        }
	        // clear form vars
	        setTimeout(function() { form.clk = form.clk_x = form.clk_y = null; }, 100);
	    }
	    
	    return this.ajaxFormUnbind()
	        .bind('submit.form-plugin', options, doAjaxSubmit)
	        .bind('click.form-plugin', options, captureSubmittingElement);
	}
})(jQuery);

XUtils.apply( String, {
    format : function( format ){
        var args = [];
        return format.replace( /\{(\d+)\}/g, function( m, i ) {
            return args[i];
        });
    }
} );
