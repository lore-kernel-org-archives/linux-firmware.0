Return-Path: <SRS0=6Fth=HU=2980.com=northwave8642@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2AFC9832F
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 03:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 091851F00893; Mon, 28 Sep 2026 03:54:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=123.1.147.92
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790567664;
	b=ns3PucsRilXn83LA2FKvVlFharnerFk2CnYNV2D1wKpZhAI+LTHkNOArcmF+es+B19fj
	 uwpNDonvmPEo/eNmu0JlMOMcF8kXU537lkM3rq3Ee8bKZzwOmOvf7UDOI1yaI328BjLkV
	 ERtjk309rJ6+3j8OohMskn3Tr2tH5RFZrV7eB82AOPGcNi0ABDlLu16dqXL5Pr3dX/r4X
	 5ISw7OfrXNf4LvGz5ppBcwXhxtC6Y9iSX5UESWLaGcd0BJ46z1fMNt2zF/sfQE1vT6mPb
	 BngqExLUMA46MTKIbRQOdzPn/jI4gJNfRgaxC8MR+IPAFHwT88jFQBB46IWriseeqfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790567664;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:List-Id:To:Message-ID:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QYczhDUX6qI93rPNTdX98vEMvzUcNDZ4/rA7zKGhlII=;
	b=1/jmDqPRb+a3BXsfHSOXuPlYtsBd/5cvjNqSN9EoKZv3WWSW++n/FPzXbNQ3NQ4cibfW
	 /JBy7FOU/lYTq1A2y6jjuuLAeVuBzX6EPWmtgiqfpau+Nhr7XJdbl0zqK2uGlBuwPxnlV
	 MNRZOBY4xs60mH8m0N9mAtiBJFYc4q0vbEqN8JnKsHa/NIOqI/7E+t4u/TsX5pKizYe1O
	 CZNNIanSaGky7HGO3xOcK/vEV3rwjIByJhZwNObUoskga2jpCGQ8U+ucS5URfmo8h+zeV
	 hcfO+yuxAyks9Kj68e4NW1mfgaywRuM7UT/T8rpRU8+fNeaZSFbVwRHywSLYOycp3Sw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=2980.com header.i=@2980.com header.a=rsa-sha256 header.s=dkim2026 header.b=M65O6kwi;
	dmarc=pass header.from=2980.com;
	spf=pass smtp.mailfrom=2980.com;
	arc=none smtp.remote-ip=123.1.147.92
Received: from mailex.2980.com (mailex.2980.com [123.1.147.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45FEF1F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 03:54:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=2980.com header.i=@2980.com header.a=rsa-sha256 header.s=dkim2026 header.b=M65O6kwi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 45FEF1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=2980.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=2980.com
DKIM-Signature: v=1; a=rsa-sha256; d=2980.com; s=dkim2026; c=relaxed/relaxed;
	t=1790567635; h=from:date:subject:to:message-id;
	bh=QYczhDUX6qI93rPNTdX98vEMvzUcNDZ4/rA7zKGhlII=;
	b=M65O6kwip4wNJNUY+i1HWH9Vv1iXUFAz+lLiGUeapnaomAz2ZVeZ+lmIJvGMESJgTNRrk3vHQqg
	n6oojOSRpiViGhuUWLXn6fxBmNiTe06Neg7jaUuS7xWs7THmFGWKVv3emvhpzyKyxwbgQycO///cf
	3hDt+xBA3+Kr/WRFZVMiQEB5HmxL6TUrKEidDUkV2aplYujDz7+AChSsAVbwHqTb8AHDGs4xZiqDk
	mq5s0xLuwYnKyw0NYsiSASzgmtfjAIW/Ea2q07QTLur7ZP8zVVxMTr2eubXeIoaDtNzOt2JMY1go9
	nLuQmlgsuZq26SdpTP5yy3qItdIhsDkmsIUQ==
Received: from 811b6d7f5e3a ([113.124.178.237]) by 2980.com via TCP with ESMTPA; Mon, 28 Sep 2026 03:53:53 +0000
Date: Mon, 28 Sep 2026 11:53:50 +0800 (CST)
From: northwave8642@2980.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Message-ID: <285093115.7862.1790567630436@811b6d7f5e3a>
Subject: Exploring automated multi-language support for Handheld Daemon via
 translate.js
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, Handheld Daemon team,

 I am translate.js  Written by Guan Leiming. I have been following Handheld=
 Daemon, an open-source project that provides support for Linux and Windows=
-based handheld gaming devices; it seems like you are creating excellent ha=
rdware-enabling tools for players around the world.

 I=E2=80=99m writing to ask whether you=E2=80=99re interested in giving it =
a try by integrating it into the project translate.js ? With just two simpl=
e lines of code, it may be possible to add automated multi-language switchi=
ng to the project, without the need to modify any code or manually maintain=
 configuration files, thereby helping you reach players from different lang=
uage backgrounds more quickly.

 If you are interested in learning how to do it, you can first take a look =
at our demo website http://translate.zvo.cn  .
