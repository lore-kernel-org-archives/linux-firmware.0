Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739B606A323
	for <linux-firmware@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=hwiVQjp4
Received: by smtp.kernel.org (Postfix)
	id 9A2421F008A3; Sun,  8 Nov 2026 09:41:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794130899;
	b=nlgMdmRlzFRjeI/hGc04wEhW0x/48zFyZMIDSRHr+YUfVPHxmr0g5QXcFqfGPpc3PuHq
	 m9dedhi38KdUx8gZ72Z1Qa7GKEKXZQMNKu/V0oasqPp6gPKvclDFun13igyY6QhEZROpF
	 bMpYAyXYQ0EIWu0TRym6xdnzukLRZxBCaC0BcgogHEkraa286XLlby5BtTthYlHOnpEdl
	 LmipSHAay8Ne/MPXkZwEioWO535BVTsTS2gpMT7tlFNEFAmYzfDt5tC9iYgW4AQOYopF7
	 2wXpwWnY1cmL2Id+JO3w2LEddVfnW8/IFFobU+Cw4rXAHflt1fiqQqW8763SrtNbLjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794130899;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:List-Id:Cc:Subject:
	 Message-ID:Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=P6BeC2cxLnO9+ZTRwM6ZxloCCWpY5h5DCyMeSsfggT8=;
	b=Ri7MF8ms+LStLnQkGY42jm6hLH/W3AdYeZU6Fka992r6s6Qo7TqBWE3NxNDhK3sCbXIo
	 bYe37+B3h+ogrpRCRmr5NPJfcrq8/6+ZGAeydoLxuwnEDnsaY+4gTQmagyhZwjOJ/plJx
	 KMHmMV6/BaPLweUP0EqtnTkNS4dAajk8gLT+wT27CApC6OTh6VOY8Me/WdDythY5rxJZd
	 VAAo/uV2K29nLS0roc8020wk7h385NTXXSNv32ZSNmCrWDx7hiNET110v3fVGYZ3WwzCN
	 5IdXHTiZqPSsOkfdFBd7COuI2v7kAzhy2GCk+zQG+HEUzOL4aiqy6NXudrA7XJM0F5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=hwiVQjp4;
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 264AC1F0089F
	for <linux-firmware@kernel.org>; Sun,  8 Nov 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=hwiVQjp4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 264AC1F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794130896; x=1794390096;
	bh=P6BeC2cxLnO9+ZTRwM6ZxloCCWpY5h5DCyMeSsfggT8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hwiVQjp4OW9XE/kTm9NK8og7X+iPXz9dtgrt8Ew0B2mkuCvIWE8akg7KDOCSkdaGQ
	 IfpESJ7jUtf84Rv6VtVlypYhNf1xIEdBmsuO6LS2ylEED+jsDq4PlJsEbS36T06HDC
	 2BMnFLIk+7qSUK1djlYSvudy4Mh8ZuXfYzhpLHQodk0o1/MlreWm4YQEpVAOUF+fb4
	 qDcUBiYPLAyzTbPPTq3aqdKQ4124mr791h/WRGIO/73kE++HCmRfV2g8FqYnuEo4aP
	 oL4Mv2JiqtBU2AxpH6F1uFfhuI4CRBNae3QUcaFycRzWg+YuK4Cyf+GW0r8KdxVLDT
	 irsBGBQMWPp9Q==
Date: Sun, 08 Nov 2026 09:41:31 +0000
To: "hayeswang@realtek.com" <hayeswang@realtek.com>
From: oraveeps@pm.me
List-Id: <linux-firmware.lore.kernel.org>
Cc: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>, "mail@birger-koblitz.de" <mail@birger-koblitz.de>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
Message-ID: <PfNGg6VjMdDzTCX2LETCm65NKSR0af1EG7ZX5CI-7Fef0x8NE2MnZ8fNtgr1Hm86sNjqHXcNyyqIbbeZL5jDu7URTqMygnyj4ulG00NxR7U=@pm.me>
Feedback-ID: 208684824:user:proton
X-Pm-Message-ID: 5d10235b135ef8367656b045209c15d48b5ed149
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1=_Yb9UEw2MV6GNxjTuJZ4LjU5LBqtXMBOsGC6htdWuGHo"
X-Spam-Status: No, score=1.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--b1=_Yb9UEw2MV6GNxjTuJZ4LjU5LBqtXMBOsGC6htdWuGHo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSGF5ZXMsCgpTaW5jZSBjb21taXQgYTUxZTE3MWUxNzZjICgicjgxNTI6IEFkZCBmaXJtd2Fy
ZSB1cGxvYWQgY2FwYWJpbGl0eSBmb3IKUlRMODE1Ny9SVEw4MTU5IiksIG1haW5saW5lIHI4MTUy
IHJlcXVlc3RzIHJ0bF9uaWMvcnRsODE1OS0xLmZ3IGZvciB0aGUKUlRMODE1OSBQSFkuIFdpdGhv
dXQgaXQgdGhlIGxpbmsgc3RheXMgYXQgNSBHYml0L3MsIGFuZCBsaW51eC1maXJtd2FyZQpoYXMg
bm8gcnRsODE1OS0xLmZ3IHlldCAobm9yIHJ0bDgxNTctMS5mdykuCgpJIHJ1biB0aHJlZSBSVEw4
MTU5IGFkYXB0ZXJzIChVU0IgSUQgMGJkYTo4MTVhKSBvbiBrZXJuZWwgNy4yLjQuIFRoZXkKcmVh
Y2ggMTAgR2JpdC9zIG9ubHkgd2l0aCBSZWFsdGVrJ3Mgb3V0LW9mLXRyZWUgcjgxNTIgdjIuMjIu
MSwgd2hpY2gKY2FycmllcyB0aGUgUEhZIHBhdGNoIGluc2lkZSB0aGUgZHJpdmVyLiBXaXRoIHJ0
bDgxNTktMS5mdyBpbgpsaW51eC1maXJtd2FyZSwgdGhlIGluLXRyZWUgZHJpdmVyIGNvdWxkIGRv
IHRoZSBzYW1lIGFuZCB1c2VycyBjb3VsZApkcm9wIHRoZSBvdXQtb2YtdHJlZSBtb2R1bGUuCgpD
b3VsZCBSZWFsdGVrIHN1Ym1pdCBydGw4MTU5LTEuZncsIGFuZCBydGw4MTU3LTEuZncgaWYgdGhl
cmUgaXMgb25lLCB0bwpsaW51eC1maXJtd2FyZT8gSSBhbSBoYXBweSB0byB0ZXN0IGEgY2FuZGlk
YXRlIGZpbGUgb24gdGhlc2UgYWRhcHRlcnMuCgpUaGFua3MsCkpvbmFzIEF1dHplbg==

--b1=_Yb9UEw2MV6GNxjTuJZ4LjU5LBqtXMBOsGC6htdWuGHo
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDE0cHg7Ij48c3Bhbj5IaSBIYXllcyw8L3NwYW4+PGRpdj48YnI+PC9kaXY+
PGRpdj48c3Bhbj5TaW5jZSBjb21taXQgYTUxZTE3MWUxNzZjICgicjgxNTI6IEFkZCBmaXJtd2Fy
ZSB1cGxvYWQgY2FwYWJpbGl0eSBmb3I8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5SVEw4MTU3L1JU
TDgxNTkiKSwgbWFpbmxpbmUgcjgxNTIgcmVxdWVzdHMgcnRsX25pYy9ydGw4MTU5LTEuZncgZm9y
IHRoZTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPlJUTDgxNTkgUEhZLiBXaXRob3V0IGl0IHRoZSBs
aW5rIHN0YXlzIGF0IDUgR2JpdC9zLCBhbmQgbGludXgtZmlybXdhcmU8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj5oYXMgbm8gcnRsODE1OS0xLmZ3IHlldCAobm9yIHJ0bDgxNTctMS5mdykuPC9zcGFu
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+SSBydW4gdGhyZWUgUlRMODE1OSBhZGFw
dGVycyAoVVNCIElEIDBiZGE6ODE1YSkgb24ga2VybmVsIDcuMi40LiBUaGV5PC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+cmVhY2ggMTAgR2JpdC9zIG9ubHkgd2l0aCBSZWFsdGVrJ3Mgb3V0LW9mLXRy
ZWUgcjgxNTIgdjIuMjIuMSwgd2hpY2g8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5jYXJyaWVzIHRo
ZSBQSFkgcGF0Y2ggaW5zaWRlIHRoZSBkcml2ZXIuIFdpdGggcnRsODE1OS0xLmZ3IGluPC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+bGludXgtZmlybXdhcmUsIHRoZSBpbi10cmVlIGRyaXZlciBjb3Vs
ZCBkbyB0aGUgc2FtZSBhbmQgdXNlcnMgY291bGQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5kcm9w
IHRoZSBvdXQtb2YtdHJlZSBtb2R1bGUuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
PHNwYW4+Q291bGQgUmVhbHRlayBzdWJtaXQgcnRsODE1OS0xLmZ3LCBhbmQgcnRsODE1Ny0xLmZ3
IGlmIHRoZXJlIGlzIG9uZSwgdG88L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5saW51eC1maXJtd2Fy
ZT8gSSBhbSBoYXBweSB0byB0ZXN0IGEgY2FuZGlkYXRlIGZpbGUgb24gdGhlc2UgYWRhcHRlcnMu
PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+VGhhbmtzLDwvc3Bhbj48L2Rp
dj5Kb25hcyBBdXR6ZW48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyIgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Js
b2NrICI+DQogICAgPGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stdXNlciBw
cm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+PC9kaXY+DQogICAgDQogICAgICAgICAg
ICA8ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1wcm90b24iPjxicj48L2Rp
dj4NCjwvZGl2Pg0K


--b1=_Yb9UEw2MV6GNxjTuJZ4LjU5LBqtXMBOsGC6htdWuGHo--

