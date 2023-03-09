Return-Path: <SRS0=BvvL=7B=tactileint.org=bojnac@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369CDC64EC4
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Mar 2023 18:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB205C4339C; Thu,  9 Mar 2023 18:25:18 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 513D1C433D2
	for <linux-firmware@kernel.org>; Thu,  9 Mar 2023 18:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 513D1C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tactileint.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tactileint.org
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 48E5C320092F;
	Thu,  9 Mar 2023 13:25:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 09 Mar 2023 13:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tactileint.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1678386315; x=
	1678472715; bh=RnAfZIa3gjKAuuNwadjD8Zyl5yf7uSWu9sZwXYrFyJM=; b=C
	3kTzCj0gos0bufceS2TIemJKbGnW2zWzn/QCIIQsDzpw+mAZnIKP/t+J2XDCfFOV
	txa3OV8ANIdUVAoL7haik27ikmpSiWf2I5xtSClRdEh8Nzo8ovce//w07X8xTFS5
	hdjveNnFj1sW11t+FFkbsPYa/OvqLAHn+426UkD5YTQzruTsTyUgS628Mh/a+TGp
	TlQwFNj9XCR3IKD2IgNTlSwKQaXcvPsO9WFCJAydzWxagiskDEXfjQ6m11qfvdyW
	kzTUDsefjeAAZaPlIMkWDu0vCtR5E41JEiFfyktgd/478X2GaAnBrnxt9vuXE06H
	1M262cO54YHOI0Xa86lFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1678386315; x=1678472715; bh=R
	nAfZIa3gjKAuuNwadjD8Zyl5yf7uSWu9sZwXYrFyJM=; b=jf/5FNUOVqwlCOlFz
	OBTbEttsA486GS0RijQRFLpooO+YghEHIHht+O8Z8ZC0jvXZOzT/syJ8nvN1fPgP
	kaO95vJp07hiNt2v4IZUnZCNHhkCFRJruJfX7vMA/CmxCxGNJ7aC2ciA6BTjhBVS
	tGf0YbI2Fr0438MeR/Y5grgOUpfxGHehdHWlD66p9pAXb2/kv2zfLyW8zca1180t
	zLnRryKPixc5JudEuLYjr/cRnXImOdFHSQ+yIHiPblL4Mr6kpl4cJ5ZXePOZ2Q2y
	g307+geTLX91lxzGOZghf68kiNE35UsBxWv6CVvvEkYWQv7twEQPMSFCyd0KHnbk
	QGiZw==
X-ME-Sender: <xms:iyQKZJo-I2gOb5cVqq54UPLR5UqCRIqlqZ0cqvrdJCb6V1vwDwKDlA>
    <xme:iyQKZLofLosvxyAQMn5d3uaLG212CaOWSiPO79X-cjwFeolZAFBYi4mCi6naTYTyE
    2QbH0jhganQmnGIjA>
X-ME-Received: <xmr:iyQKZGP2_DVHSjDd-X498pd4VpTKjvv31Kg4ZOtdv8YuY6Zc7DA6DUR5Nt9Crepn7ciM0OdOLePG3yCA-sGHWrHxloxfeuuc1cTdpm0GLZgmcFE4O4-J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduiedguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephfgtgfggfffuvefvkffosehtje
    hmtdhhtddvnecuhfhrohhmpeetlhhlrghnuceuohhnrgguihhouchjuceosghojhhnrggt
    sehtrggtthhilhgvihhnthdrohhrgheqnecuggftrfgrthhtvghrnhepheelledvleffte
    dvteehjeefieduvefhgeehhfelhfehleduheeklefhjedvhfelnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghojhhnrggtsehtrggtthhilh
    gvihhnthdrohhrgh
X-ME-Proxy: <xmx:iyQKZE5GOYQScDDnRmuZi3idwCSI0TycODZQjgqhrQMcwacZe4zl6w>
    <xmx:iyQKZI7HuHFs0ov4ATtSLxfnzm1r9Exi7s_i67gVAjmRgV7wzutpGw>
    <xmx:iyQKZMgnxQr3lbTTXA5OnJq8CcWLLkOStif3Cv6_-uLlx0f1TaGR3w>
    <xmx:iyQKZGSNqVTSAKDLm8q3ltPEHiYAE5ifA4kp-_3SQILSEE2snz84mg>
Feedback-ID: i3768409c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Mar 2023 13:25:15 -0500 (EST)
From: Allan Bonadio j <bojnac@tactileint.org>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Date: Thu, 9 Mar 2023 10:25:03 -0800
Subject: Re: Security Notice. linux-firmware@kernel.org was hacked! Change
 your password now!
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
To: nmyupzzq@freelymail.com
Message-Id: <0F152C04-37C9-499F-B06E-07AC57A20AB9@tactileint.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)


I got one of these emails, too.


