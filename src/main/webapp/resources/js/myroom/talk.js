
// 카카오 채널 채팅 이용
function chatChannel() {
	Kakao.Channel.chat({
	channelPublicId: '_GXbxnb',
	})
}

// 카톡 홍보용
function sendLinkCustom() {
	        Kakao.init("d878b9c5a53554c8156c11b1061679f2");
	        Kakao.Link.sendCustom({
	            templateId:  69366
	        });
	    }