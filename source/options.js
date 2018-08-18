var settings = {
	"postkey": "radio",
	"tootbutton": "radio"
};

$(() => {
	// setting load
	var s_keys = Object.keys(settings);
	chrome.storage.local.get(s_keys, (vals) => {
		// radios
		s_keys.filter((sk) => settings[sk] == "radio").forEach((s) => {
			var v = vals[s];
			$(`input[type=radio][name=${s}][value=${v}]`).prop("checked", true);
		});
	});

	$("input[type=radio]").on("change", function () {
		// state changed
		var t = $(this);
		var name = t.prop("name");
		var val = t.val();
		var sav = {};
		sav[name] = val;
		chrome.storage.local.set(sav, (e) => {
			informationUpdate(`[${name} = ${val}] Update OK.`);
		});
	});
});

function informationUpdate(str){
	$("#information").text(str);
	$("#infos").show();
}