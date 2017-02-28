   /**
    * 合并单元格【td 内容相同的合并】
    */
   jQuery.fn.rowspan = function(colIdx) { //封装的一个JQuery小插件 
		return this.each(function(){ 
		var that; 
		$('tr', this).each(function(row) { 
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) { 
					if (that!=null && $(this).html() == $(that).html()) { 
						rowspan = $(that).attr("rowSpan"); 
						if (rowspan == undefined) { 
							$(that).attr("rowSpan",1); 
							rowspan = $(that).attr("rowSpan"); 
						} 
						rowspan = Number(rowspan)+1; 
						$(that).attr("rowSpan",rowspan); 
						$(this).hide(); 
					} else { 
						that = this; 
					} 
				}); 
			}); 
		}); 
	}
	/**
	 * 合并单元格【td的id相同的合并】
	 */
	jQuery.fn.rowspanCol = function(colIdx) { //封装的一个JQuery小插件 
		return this.each(function(){ 
		var that; 
		var htmlStr = "";
		$('tr', this).each(function(row) { 
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) { 
					if (that!=null && $(this).attr('id') == $(that).attr('id')) { 
						if($(this).html() != ""){
							htmlStr = $(this).html();
						}
						rowspan = $(that).attr("rowSpan"); 
						if (rowspan == undefined) { 
							$(that).attr("rowSpan",1); 
							rowspan = $(that).attr("rowSpan"); 
						} 
						rowspan = Number(rowspan)+1; 
						$(that).attr("rowSpan",rowspan); 
						$(that).html(htmlStr);
						$(this).hide(); 
					} else { 
						that = this; 
						if($(that).html() != ""){
							htmlStr = $(that).html();
						}else{
							htmlStr = "";
						}
					} 
				}); 
			}); 
		}); 
	}
