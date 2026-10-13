Return-Path: <SRS0=Ewjd=ID=token8341.com=mail@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB81CC6B12
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Oct 2026 22:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C5BA1F00893; Tue, 13 Oct 2026 22:43:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=140.205.208.143
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791931387;
	b=yEAMTbbGgWIwtYYUANU93AgFkXbsThOKxMjhT6R5cTJcyrku+fwXmAomuGNZsmdvG+3S
	 UD0P/F898R50C2z/OT1MdcEgZV55zEs545yR9jlBpXMnXO2DgtUFI43C60XP3Y2OgvlUP
	 A2K9mSukiLOoxUpRyBxZP4KSBoPruW9NTSgcRinplQAEl+Q5GlhgFC4egfb/Zg3svEMtf
	 WfV0tDdNr0C+xlB/mGqwRzcDp4swoCmKXsmszyWyV6sEvqwRB3DtihmLlTvgNJfHL5wuG
	 NRBMli0EMY7M8nGoOEuJyiG2xGoldwooVAH+X1mJemOvJounptndIFr31IWTKSzqXPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791931387;
	h=DMARC-Filter:X-AliDM-RcptTo:Feedback-ID:DKIM-Signature:Received:
	 X-EnvId:Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:
	 From:List-Id:To:Date:Message-ID:List-Unsubscribe:
	 List-Unsubscribe-Post;
	bh=uOfNBi+NBLV0ioM9o+3QE0jTl/H9ZhLsGTedIXRiABU=;
	b=KUCWV33hLHp7E6y0VNasuTbB50JpG7IHsGCgyO2q29zhglq685pF9vzW1P/cWBTEGRx9
	 bL6E1HomPSgWa0si5KAVqd7Jwd2eRYmdpSZfmKSk5jhgxqBU9w91jrjexTFcy+CjYYyzz
	 +LbW7OpTE2YoewY7cQfrqUIgiUgKAju7mriX3h2daWWsZDiyiKoXQAD5X0gwCHZ//fEdq
	 /EU2JxYiv2Uqk2wvIXjy+XCnjswsA6h9WDyGmTaDPZaIyb7JIcCtnvxo7t94UVouTTtMA
	 ehrm8VeatcAOIIZ0pr8ami7UEHxKUwFoVWhsog8vC76rpL6Rj+E6SnD3gMPUPrz31qA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=token8341.com header.i=@token8341.com header.a=rsa-sha256 header.s=aliyun-cn-hangzhou header.b="e4f/ctiV";
	dmarc=pass header.from=token8341.com;
	spf=pass smtp.mailfrom=token8341.com;
	arc=none smtp.remote-ip=140.205.208.143
Received: from out208-143.dm.aliyun.com (out208-143.dm.aliyun.com [140.205.208.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 697811F000FF
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 22:43:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=token8341.com header.i=@token8341.com header.a=rsa-sha256 header.s=aliyun-cn-hangzhou header.b=e4f/ctiV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 697811F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=token8341.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=token8341.com
X-AliDM-RcptTo: bGludXgtZmlybXdhcmVAa2VybmVsLm9yZw==
Feedback-ID: default:mail@token8341.com:alibabak_SmtpBatch:555662
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=token8341.com; s=aliyun-cn-hangzhou;
	t=1791931377; h=Content-Type:MIME-Version:Subject:From:To:Date:Message-ID:List-Unsubscribe:List-Unsubscribe-Post;
	bh=uOfNBi+NBLV0ioM9o+3QE0jTl/H9ZhLsGTedIXRiABU=;
	b=e4f/ctiVlTfyM1pNnfUFNCET73VM+RX5mZUuMX7GP67j6W2IrZZpyEIQcxPhURvNmQNV8Gw6w8dPT5sRHN2bwP4ZEIdEn9t6VXMCjGhJ4q2tU8hnd0gUTzmK1y8RmpNIA7BcyeestDj9+ZVawvMxeBU48osYxnKscEXCL2iZhs0=
Received: from localhost.localdomain(mailfrom:mail@token8341.com fp:SMTPD_-VHcGRIrts6 cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Wed, 14 Oct 2026 06:42:57 +0800
X-EnvId: 600000365670145553
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: =?utf-8?b?44CQ56GF56Kz55u45Y+Y44CRVG9rZW5Xb3JrcyDmnI3liqHlm57orr8=?=
From: TokenWorks <mail@token8341.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Date: Wed, 14 Oct 2026 06:42:57 +0800
Message-ID: <179193137723.996008.9507756183148267923@token8341.com>
List-Unsubscribe: <mailto:unsubscribe@token8341.com?subject=unsubscribe>
List-Unsubscribe-Post: List-Unsubscribe=One-Click

5oKo5aW977yM5oiR5Lus5pivIFRva2VuV29ya3PvvIzmg7Pkuobop6PkuIDkuIvmgqjnmoTkvb/n
lKjmg4XlhrXjgII=
