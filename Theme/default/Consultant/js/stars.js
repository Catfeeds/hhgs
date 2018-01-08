window.onload = function() {
	var oStar = document.getElementById("star");
	var aLi = oStar.getElementsByTagName("li");
	var oUl = oStar.getElementsByTagName("ul")[0];
	var oSpan = oStar.getElementsByTagName("span")[1];
	var oP = oStar.getElementsByTagName("p")[0];
	var i = iScore = iStar = 0;
	var aMsg = ["很不满意|服务质量非常差，非常不满", "不满意|服务质量差，不满意", "一般|服务一般", "满意|服务质量不错，还是挺满意的", "非常满意|服务质量非常好，非常满意"]
	for (i = 1; i <= aLi.length; i++) {
		aLi[i - 1].index = i;
		aLi[i - 1].onmouseover = function() {
			fnPoint(this.index);
			oP.style.display = "block";
			oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";
			// oP.innerHTML = "<em><b>" + this.index + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]
			oSpan.innerHTML = "<strong id='score' data-value='" + this.index + "'>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
		};
		// aLi[i - 1].onmouseout = function() {
		// 	fnPoint();
		// 	oP.style.display = "none"
		// };
		aLi[i - 1].onclick = function() {
			iStar = this.index;
			oP.style.display = "none";
			oSpan.innerHTML = "<strong id='score' data-value='" + this.index + "'>" + (this.index) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
		}
	}
	function fnPoint(iArg) {
		iScore = iArg || iStar;
		for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : ""
	}
};