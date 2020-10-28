Return-Path: <SRS0=GGxF=ED=ti.com=tomi.valkeinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12FAC4363A
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Oct 2020 07:41:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A60CB2417E; Wed, 28 Oct 2020 07:41:44 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BF12417A
	for <linux-firmware@kernel.org>; Wed, 28 Oct 2020 07:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="raoGhAXm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BF12417A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=tomi.valkeinen@ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09S7fflf084854;
	Wed, 28 Oct 2020 02:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603870901;
	bh=Ax5/lSVFdAWpt9N2W3x9j4u+NVI3bfPAN+kwxm2q5AI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=raoGhAXmq3ocu16M6jlyQYXYzmVRaiB9n8hZw1ttz+o0924DH2aECLm7m9xafn1HX
	 WvgWroNC65gk0U6UOLc8fnnvvbZPDKNUBBU5liL92QxS1R39oTuyfH0/HyMD6/Hfso
	 4jAbxLxfq6L6+Yc9c6P3orNRTYIHKNq0uP0gAdbA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09S7ffpE084829
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Oct 2020 02:41:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 02:41:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 02:41:41 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09S7fdQd121725;
	Wed, 28 Oct 2020 02:41:40 -0500
Subject: Re: [PATCH] vpdma: Move firmware to the toplevel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <linux-media@vger.kernel.org>,
        Dan Murphy
	<dmurphy@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Sekhar Nori
	<nsekhar@ti.com>
References: <20201026200922.12719-1-nikhil.nd@ti.com>
 <20201026210832.GE3756@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <868ff235-20c7-b0c0-df08-3d4582adb544@ti.com>
Date: Wed, 28 Oct 2020 09:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026210832.GE3756@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 26/10/2020 23:08, Laurent Pinchart wrote:
> Hi Nikhil,
> 
> Thank you for the patch.
> 
> On Tue, Oct 27, 2020 at 01:39:22AM +0530, Nikhil Devshatwar wrote:
>> Move the vpdma firmware to the toplevel directory so
>> that the existing drivers can use it with the same path.
>>
>> Fixes: 5b30b383ce ("linux-firmware: Add new VPDMA firmware 1b8.bin")
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>  WHENCE                                         |   2 +-
>>  ti-connectivity/vpdma-1b8.bin => vpdma-1b8.bin | Bin
> 
> I think Tomi meant moving the file to ti/ instead of ti-connectivity/. I
> will let him comment on this.

I don't really have a strong opinion here, as I don't know if there are some rules or guidelines
about file/dir naming in linux-firmware.

But my argument is:

The fw should either be at the root dir, where the linux driver is already looking for it, OR, if we
do move it somewhere, move it to a "right" place. Afaics "ti-connectivity" is totally wrong place,
as vpdma has nothing to do with connectivity.

The root dir is a bit bad as "vpdma-1b8.bin" doesn't have TI or such in its name, so even if name
conflict with some other fw feels quite unlikely, the name is still rather vague. And moving is a
bit bad as then the current driver won't find the fw...

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
