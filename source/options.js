var settings = {
	"keys": "radioeditObjectArray",
	"keys_selected": "radio",
	"postkey": "radio",
	"tootbutton": "radio",
	"tootbtnText": "text",
};

$(() => {
	// setting load
	var s_keys = Object.keys(settings);
	chrome.storage.local.get(s_keys, (vals) => {
		// radio/editable array
		s_keys.filter((sk) => settings[sk] == "radioeditObjectArray").forEach((s) => {
			var v = vals[s];
			Object.keys(v || {}).filter((inst) => inst != "tmpurl").forEach((inst, i) => {
				$(`ul#${s}`).append(`
					<li class="ui-state-default">
						<div class="arrayitem" data-index=${i}>
							<input type="radio" id="${s}_${i}" value=${i} name="${s}_selected" ${(vals[`${s}_selected`] || 0) == i ? "checked" : "" } />
							<label for="${s}_${i}" class="name">${inst}</label>
							<i class="objectarraydelete" data-key=${s} data-instance=${inst} data-target=${i}>×</i>
						</div>
					</li>
				`);
			})
		});
		// radios
		s_keys.filter((sk) => settings[sk] == "radio").forEach((s) => {
			var v = vals[s];
			$(`input[type=radio][name=${s}][value=${v}]`).prop("checked", true);
		});
		// text
		s_keys.filter((sk) => settings[sk] == "text").forEach((s) => {
			var v = vals[s];
			$(`input[type=text][name=${s}]`).val(v);
		});
	});

	// setting save
	$(document).on("keyup change", "input[type=radio], input[type=text]", function () {
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

	// array deleted
	$(document).on("click", ".objectarraydelete", function() {
		var d = $(this);
		var k = d.data("key");
		var ins = d.data("instance");
		var i = d.data("target");
		chrome.storage.local.get(k, (vals) => {
			var obj = vals[k];
			delete obj[ins];
			var sav = {};
			sav[k] = obj;
			chrome.storage.local.set(sav, () => {
				informationUpdate(`[${ins}] Delete OK.`);
			});

		});
	});

});

function informationUpdate(str){
	$("#information").text(str);
	$("#infos").show();
}