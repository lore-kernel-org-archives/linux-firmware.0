Return-Path: <SRS0=yYuj=XA=justinweiss.com=justin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DECDC369A2
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Apr 2025 15:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04C82C4CEE9; Mon, 14 Apr 2025 15:24:34 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D05EC4CEE2;
	Mon, 14 Apr 2025 15:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D05EC4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=justinweiss.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=justinweiss.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E91CA11402B4;
	Mon, 14 Apr 2025 11:24:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 14 Apr 2025 11:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justinweiss.com;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1744644270; x=
	1744730670; bh=b1fhtYZunhQKK/BINKgc5NE/00cnKdVToVawsL0t+3M=; b=D
	XQrdJeReXVEDfamV9JP54u2caTU83xtTaYqPwdaYiWQqnktFcOAZrr4eaC9Uv4xX
	gYiTdN4A3EcVRoRxLVoS7r9pdI8T8vkbg0ol5zdPgana53QD+se3fPlNXBdnGxrM
	SqOKNrwUcGrrpzzUdN3rSnDwB1qctkBHvX91qlezXDx6MpyAQw7N2ogrDcyeYqFO
	AdsbqrMFhJUJgMHxa2UHPBbprnZTqjzzkm0kH00/uh8sXST07SKZmXtgwVXwkJpA
	VHzmsLKex5pfw9tDAD68+zvcGgoJWHW8nreI+nztE5xpjm2sqEIcCJTSBmPPWCIg
	xzzUhcwdtRGEqrt+Q91aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744644270; x=1744730670; bh=b1fhtYZunhQKK/BINKgc5NE/00cnKdVToVa
	wsL0t+3M=; b=aLxr0xC2Dvho7PyQVpZZXOjWgfzGY4heSujJv1hT9fGvSR7Yuu5
	YpB392gKE673N2R6UflP6qZERWeinNwi2uoslwkW6W0pESM7UvWBRuLvOPUVGdx6
	wF6XWIHKUex6GyEIamRViljH/B09Bu7UF+SgAQSWMyXAnbCMGNkujd7NMExEf+Mu
	tbPvr4QxJzzwg1OV1oHdg79Vmkl30qKkP6/dUZiMBTNFuTtLbxmAztX9dFqWEwW4
	5tuogtA4JQPX7mktZzO1mJNEV8DwUlGPqtO4akVlrmuW6BXmdGKMGu2RpyTMtgLe
	wZ3Ba0XIe2HM0IBpMHGXzWwpvyvxCOM71Vg==
X-ME-Sender: <xms:rij9Z3J7aYyi8juFPJQKRGf6qrjxPuoowCNXOmdni3vIlesem-z87w>
    <xme:rij9Z7IX4H4Mt8A0lPL595Kb7EkYpyBGTAJKUfRiGq_BaJDYBkLsIRItPWKYx-W9T
    5QB7eNhFvZRNBpSIA>
X-ME-Received: <xmr:rij9Z_taLIZUDATbJ_DAyGA3DxUFxZoWCKmaxB5a1F1MNMot5FAWpjuW5k5tJjcx4k-TGY2y-JR7qEbH-UxCCMvgoq4Ei9l7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtleduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkfgggtgesthdtredttder
    tdenucfhrhhomheplfhushhtihhnucghvghishhsuceojhhushhtihhnsehjuhhsthhinh
    ifvghishhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuhfffleejudeggfehueeiuefh
    geffheekvdejvdfgleevuddujeeufeeihfefueenucffohhmrghinheptghhrhhomhhiuh
    hmrdhorhhgpdhgohhoghhlvgdrtghomhdpghhoohhglhgvshhouhhrtggvrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhushhtih
    hnsehjuhhsthhinhifvghishhsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehlkhhmlhesrghnthhhvggrshdruggvvhdprhgtph
    htthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepphhhihhlmhesmhgrnhhjrghrohdrohhrghdprhgtphhtthhopegtrhihohhlihhtih
    grsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqfhhirhhmfigrrhgvsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehjfigsohihvghrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rij9Zwar58hLGpSBPw_UIUlXls4GTqMD2zkJp3suYxDQaWOwr6neQQ>
    <xmx:rij9Z-b5Fsj7oTYE3jUIImDLnZTbieX9wcGMfCfJnfq5AWN-Hdtxxg>
    <xmx:rij9Z0CnOyviD2Xw25GuJ63mJYCldrWG2wCsx88bG9CONtetnwoA0w>
    <xmx:rij9Z8ZHRyJ-oD69aAdZGvPlPjfZK81b516XcE17kkVBTxVm7WoZug>
    <xmx:rij9Z_QktbGZw2kXVSJ4nz3F9HhBtoBXZLzdt0du8Yp4DLjL65QB__do>
Feedback-ID: icf614246:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Apr 2025 11:24:29 -0400 (EDT)
From: Justin Weiss <justin@justinweiss.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,  Cryolitia PukNgae <Cryolitia@gmail.com>,
  Philip =?utf-8?Q?M=C3=BCller?= <philm@manjaro.org>,  Derek John Clark
 <derekjohn.clark@gmail.com>,  Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH] bmi260: Add BMI260 IMU initial configuration data file
In-Reply-To: <CA+5PVA5NXCpWMdJPme3n6y9m-vm3GR3KfqhVwqW9pxiRnLgkbA@mail.gmail.com>
 (Josh
	Boyer's message of "Mon, 14 Apr 2025 06:53:58 -0400")
References: <20250413211334.61316-1-justin@justinweiss.com>
	<CA+5PVA5NXCpWMdJPme3n6y9m-vm3GR3KfqhVwqW9pxiRnLgkbA@mail.gmail.com>
Date: Mon, 14 Apr 2025 08:24:28 -0700
Message-ID: <87r01upxzn.fsf@justinweiss.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain

Josh Boyer <jwboyer@kernel.org> writes:

>> +Driver: bmi260 - Bosch BMI260 IMU configuration data
>> +File: bmi260-init-data.fw
>> +
>> +License:
>> + Copyright (c) 2020 Bosch Sensortec GmbH. All rights reserved.
>> +
>> + BSD-3-Clause
>
> The license doesn't go in WHENCE, it goes in a separate license file
> which is then referenced from WHENCE.  It is also later installed onto
> the target systems when installing linux-firmware.
>

Thanks, I'll make that change.

>> +Originates from
>> https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/ec/third_party/bmi260/accelgyro_bmi260_config_tbin.h
>
> Normally we'd look for submissions of firmware to be sent by the
> company, or at least acked.  I doubt this will happen in this case.  I
> dug into the cited project a bit and there's a non-public bug
> https://issuetracker.google.com/issues/130415695 that is cited from
> the initial submission
> https://chromium-review.googlesource.com/c/chromiumos/platform/ec/+/2086534
> but that's not super helpful.

Unfortunately, I have not been able to get in touch with anyone from
Bosch on this. While searching for a contact, I did get an email
response from one of the particpants on the initial submission, who
said:

> Regarding the initialization config file, Bosch provided me with the
> LICENSE file that I submitted to the ChromiumOS codebase.

Justin

>
> josh
>
