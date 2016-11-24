/**
 * Chat logic
 *
 * Most of the js functionality is inspired from anatgarg.com
 * jQuery tag Module from the tutorial
 * http://anantgarg.com/2009/05/13/gmail-facebook-style-jquery-chat/
 *
 */


var chatboxFocus = new Array();
var chatBoxes = new Array();

var ready = function () {

    chatBox = {

        /**
         * creates an inline chatbox on the page by calling the
         * createChatBox function passing along the unique conversation_id
         * 
         * @param conversation_id
         */

        chatWith: function (conversation_id) {
             $.get("conversations/" + conversation_id, function () {
                // $('#chatbox_' + conversation_id).html(data);
                // $("#chatbox_" + conversation_id + " .chatboxcontent").scrollTop($("#chatbox_" + conversation_id + " .chatboxcontent")[0].scrollHeight);
            }, "script");

            // chatBox.createChatBox(conversation_id);

            // $("#chatbox_" + conversation_id + " .chatboxtextarea").focus();
        },


        // notify: function () {
        //     var audioplayer = $('#chatAudio')[0];
        //     audioplayer.play();
        // },

        checkInputKey: function (event, chatboxtextarea, conversation_id) {
            if (event.keyCode == 13 && event.shiftKey == 0) {
                event.preventDefault();

                message = chatboxtextarea.val();
                message = message.replace(/^\s+|\s+$/g, "");

                if (message != '') {
                    $('#conversation_form_' + conversation_id).submit();
                    $(chatboxtextarea).val('');
                    $(chatboxtextarea).focus();
                    $(chatboxtextarea).css('height', '44px');
                }
            }

            var adjustedHeight = chatboxtextarea.clientHeight;
            var maxHeight = 94;

            if (maxHeight > adjustedHeight) {
                adjustedHeight = Math.max(chatboxtextarea.scrollHeight, adjustedHeight);
                if (maxHeight)
                    adjustedHeight = Math.min(maxHeight, adjustedHeight);
                if (adjustedHeight > chatboxtextarea.clientHeight)
                    $(chatboxtextarea).css('height', adjustedHeight + 8 + 'px');
            } else {
                $(chatboxtextarea).css('overflow', 'auto');
            }

        }
    }
}

$(document).ready(ready);
$(document).on("page:load", ready);