Return-Path: <SRS0=J/ik=53=molgen.mpg.de=pmenzel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B47CF31A6
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 11:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F282C4CEF5; Wed, 19 Nov 2025 11:20:08 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 156AEC2BCAF;
	Wed, 19 Nov 2025 11:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 156AEC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.216] (p5b13a022.dip0.t-ipconnect.de [91.19.160.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1777C61B48461;
	Wed, 19 Nov 2025 12:18:50 +0100 (CET)
Message-ID: <161ebb37-b4a7-459a-b639-d1d544f378e2@molgen.mpg.de>
Date: Wed, 19 Nov 2025 12:18:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mediatek MT7922: update bluetooth firmware to
 20251118163447
To: Chris Lu <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Hao Qin <hao.qin@mediatek.com>,
 Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-firmware@kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20251119104907.4057459-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251119104907.4057459-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Chris,


Thank you for your patch.

Am 19.11.25 um 11:49 schrieb Chris Lu:
> Update binary firmware for MT7922 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
> Version: 20251118163447

Could you please document, what changes were made in the firmware?

[…]


Kind regards,

Paul
