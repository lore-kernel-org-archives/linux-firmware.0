Return-Path: <SRS0=LcvX=GL=arm.com=jeremy.linton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CCBC433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 23:18:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC7CF23A9B; Fri,  8 Jan 2021 23:18:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 6DBD123A75;
	Fri,  8 Jan 2021 23:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DBD123A75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jeremy.linton@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DDE131B;
	Fri,  8 Jan 2021 15:18:47 -0800 (PST)
Received: from [192.168.122.166] (unknown [10.119.48.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 544F53F70D;
	Fri,  8 Jan 2021 15:18:47 -0800 (PST)
Subject: Re: [PATCH] brcm: Link rpi4's wifi with newer DMI string
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: pbrobinson@gmail.com, hdegoede@redhat.com, jwboyer@kernel.org
References: <20210108204916.1724298-1-jeremy.linton@arm.com>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <b0f1980c-7870-1431-db68-5a7156038ca8@arm.com>
Date: Fri, 8 Jan 2021 17:18:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20210108204916.1724298-1-jeremy.linton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 1/8/21 2:49 PM, Jeremy Linton wrote:
> The rpi4 when booted with a full featured
> firmware reports a machine id from SMBIOS/DMI.
> Since that is used to select the firmware we
> need to add a new symlink.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>   WHENCE | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/WHENCE b/WHENCE
> index cbde48d..1f69078 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>   File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>   Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>   File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> +Link: brcm/brcmfmac43455-sdio.Raspberryi\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt

Well looks like my turn to fail at using git/vi.

The "i" in "Raspberryi" above, which I fixed but didn't actually commit 
before sending this patch is wrong.

V2 on its way.


>   File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>   File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
>   
> 

