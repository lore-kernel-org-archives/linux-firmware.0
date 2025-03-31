Return-Path: <SRS0=8fr7=WS=pm.me=jakob.ahman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00AAC3600C
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Mar 2025 10:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B77AFC4CEE5; Mon, 31 Mar 2025 10:49:18 +0000 (UTC)
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81915C4CEEB
	for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 10:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81915C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1743418149; x=1743677349;
	bh=s/li3KrSVFy5sMewuU04NI4URRy2mmTmv7RMy9mZUyE=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Y+2WS0uXPr1JJsCBlKuekOk/Isp6nOCFBlKyupktnHoNPtvBWEGUZKDCvyaI7yUTS
	 4TmmTgg8jKCYVqdMYxF8b5+QbE1C8C0yZDLRQF2lVYMsdXN1Goujs+ylV+lJ0R8eSW
	 7cZ4FvSq6hrgN6EmlrRi212WoFMBGviqCBseBczcDTr6A5IQUAGME5gcOPBd4hp9YK
	 RAngxev6yGYNzDjesrZtFDr1IXWtg01nS2QuLCi+SlgXtm8whqKEFvZ5jkjefJ2sYs
	 B9MLqihMqV2eJlSnWeSJ5bpdCmnGdqYRYXguHY5JvXJvo9aQmbQNF76LXZ4BKXKcnQ
	 jpqEuzxo7i0VA==
Date: Mon, 31 Mar 2025 10:49:06 +0000
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
From: =?utf-8?Q?Jakob_=C3=85?= <jakob.ahman@pm.me>
Subject: Downloads not working for file linux-firmware.git
Message-ID: <kumGDjV7ju0cy6k0MkxvgQnOt8ak4IeW6jiFFVxlPcEqBLYv48PBBRsr6ketr42UHBC9rJtwzfl8_lbpGGBYLPw4vPoXBPtKYFDqdKs-Nr4=@pm.me>
Feedback-ID: 135421824:user:proton
X-Pm-Message-ID: e60bad47fe9e1722f25e0d9d537ecfbd35b3e02e
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_iNrFvhHjS0knvvvKzGQBCMIhue9PnQHxiC1VHczlz8"

--b1=_iNrFvhHjS0knvvvKzGQBCMIhue9PnQHxiC1VHczlz8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksIHRoaXMgKGFuZCBvdGhlcikgbGluayBnaXZlcyBhIDUwMyB3aGVuIHRyeWluZyB0byBkb3du
bG9hZDoKaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9zbmFwc2hvdC9saW51eC1maXJtd2FyZS0yMDI1
MDMxMS50YXIuZ3oKCkZyb20gdGhpcyBwYWdlOgpodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0LwoKS2lu
ZCByZWdhcmRzLApKYWtvYg==

--b1=_iNrFvhHjS0knvvvKzGQBCMIhue9PnQHxiC1VHczlz8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48c3Bhbj5IaSwgdGhpcyAoYW5kIG90aGVyKSBsaW5rIGdpdmVzIGEgNTAzIHdoZW4gdHJ5
aW5nIHRvIGRvd25sb2FkOjxicj48YSB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIG5v
Zm9sbG93IG5vb3BlbmVyIiBocmVmPSJodHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0L3NuYXBzaG90L2xp
bnV4LWZpcm13YXJlLTIwMjUwMzExLnRhci5neiI+aHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9zbmFw
c2hvdC9saW51eC1maXJtd2FyZS0yMDI1MDMxMS50YXIuZ3o8L2E+PC9zcGFuPjwvZGl2PjxkaXYg
c3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyI+
PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxNHB4OyI+RnJvbSB0aGlzIHBhZ2U6PGJyPjxzcGFuPjxhIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vcmVmZXJyZXIgbm9mb2xsb3cgbm9vcGVuZXIiIGhyZWY9Imh0dHBzOi8vd2ViLmdp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9saW51eC1maXJt
d2FyZS5naXQvIj5odHRwczovL3dlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0LzwvYT48L3NwYW4+PGJyPjxicj48L2Rp
dj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTog
MTRweDsgY29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1
LCAyNTUpOyI+S2luZCByZWdhcmRzLDwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlh
bCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNr
Z3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij5KYWtvYjwvZGl2PjxkaXYgY2xhc3M9
InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIHByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLWVt
cHR5IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij4NCiAgICA8ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay11c2VyIHBy
b3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLWVtcHR5Ij4NCiAgICAgICAgDQogICAgICAgICAgICA8
L2Rpdj4NCiAgICANCiAgICAgICAgICAgIDxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJl
X2Jsb2NrLXByb3RvbiBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+DQogICAgICAg
IA0KICAgICAgICAgICAgPC9kaXY+DQo8L2Rpdj4NCg==


--b1=_iNrFvhHjS0knvvvKzGQBCMIhue9PnQHxiC1VHczlz8--

