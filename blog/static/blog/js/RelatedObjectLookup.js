// Handles related-objects functionality: lookup link for raw_id_fields
// and Add Another links.

function html_unescape(text) {
    // Unescape a string that was escaped using django.utils.html.escape.
    text = text.replace(/&lt;/g, '<');
    text = text.replace(/&gt;/g, '>');
    text = text.replace(/&quot;/g, '"');
    text = text.replace(/&#39;/g, "'");
    text = text.replace(/&amp;/g, '&');
    return text;
}

// IE doesn't accept periods or dashes in the window name, but the element IDs
// we use to generate popup window names may contain them, therefore we map them
// to allowed characters in a reversible way so that we can locate the correct
// element when the popup window is dismissed.
function id_to_windowname(text) {
    text = text.replace(/\./g, '__dot__');
    text = text.replace(/\-/g, '__dash__');
    return text;
}

function windowname_to_id(text) {
    text = text.replace(/__dot__/g, '.');
    text = text.replace(/__dash__/g, '-');
    return text;
}

function showAddAnotherTagPopup(triggeringLink) {
    var name = triggeringLink.id.replace(/^add_/, '');
    name = id_to_windowname(name);
    href = triggeringLink.href
    if (href.indexOf('?') == -1) {
        href += '?_popup=1';
    } else {
        href  += '&_popup=1';
    }
    var win = window.open(href, name, 'height=500,width=800,resizable=yes,scrollbars=yes');
    win.focus();
    return false;
}

(function($) {
    dismissAddAnotherPopup = function dismissAddAnotherPopup(win, newId, newRepr) {
        // newId and newRepr are expected to have previously been escaped by
        // django.utils.html.escape.
        newId = html_unescape(newId);
        newRepr = html_unescape(newRepr);
        var name = windowname_to_id(win.name);
        var elem = document.getElementById(name);
        if (elem) {
            $(
                '<li>'
               +'<label for="' + name + '_' +  newId + '">'
               +'<input id="' + name + '_' + newId + '" name="tags" value="' + newId + '" type="checkbox" checked="checked">' + newRepr
               +'</input>'
               +'</label>'
               +'</li>'
             ).appendTo(elem);
        } else {
            var toId = name + "_to";
            elem = document.getElementById(toId);
            var o = new Option(newRepr, newId);
            // SelectBox.add_to_cache(toId, o);
            // SelectBox.redisplay(toId);
        }
        win.close();
    }
})(jQuery);
