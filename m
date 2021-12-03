Return-Path: <SRS0=3RUw=QU=collabora.com=bob.beckett@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201E3C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Dec 2021 18:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD703C53FCE; Fri,  3 Dec 2021 18:03:29 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91D40C53FAD
	for <linux-firmware@kernel.org>; Fri,  3 Dec 2021 18:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91D40C53FAD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: bbeckett)
	with ESMTPSA id 9F8591F47267
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
	t=1638554606; bh=9rPG4lrRA7KOOYrE1KsMvW65pvX8i70Us6WK7R77Bts=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=el0vXEWkHr6wiK3h4U45NX064GAc04znUswUdJqI3PUQTCAv0rmXYHb2JBLk6BxfI
	 tqfBYF4IQGf8AdOfq6b3Nxhj6sBIOAifp21g+d2R+1Do/UkQYcvPBz/aITFOUwNrmN
	 puvQljh9CkzMvPkbt0l/igsuRj87HpTm2UBxkMtpcoHQuhZJugstwM5MFn1HqK9jKu
	 Ys/jLuNOiJYGArhH1Sj3GQlTG5cf4PitkxJFmQOmkd9UY3mSD3BvBjSXLA9ZxxTWEV
	 lGE1ggg0zUGbeavYUsgjDMfBT4Uco3lfBjLUi3+ecvN5Bey7J4evPxwFzbVSHOGKCC
	 ku3XPrDWSs0rw==
Subject: Re: [PATCH] cnm: add chips&media wave521c firmware.
List-Id: <linux-firmware.lore.kernel.org>
To: Nas Chung <imhwan.ch@gmail.com>, linux-firmware@kernel.org
Cc: dafna.hirschfeld@collabora.com, olivier.crete@collabora.com,
 nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com
References: <20211126093014.1385752-1-nas.chung@chipsnmedia.com>
From: Robert Beckett <bob.beckett@collabora.com>
Message-ID: <3a9417b9-e121-62db-212e-414d0831cb15@collabora.com>
Date: Fri, 3 Dec 2021 18:03:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211126093014.1385752-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 26/11/2021 09:30, Nas Chung wrote:
> Add firmware for wave521c combined decoder and encoder IP.
> 
> FW version : 1.0.0
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>   LICENCE.cnm               |  23 +++++++++++++++++++++++
>   WHENCE                    |   8 ++++++++
>   cnm/wave521c_codec_fw.bin | Bin 0 -> 998720 bytes
>   3 files changed, 31 insertions(+)
>   create mode 100644 LICENCE.cnm
>   create mode 100644 cnm/wave521c_codec_fw.bin
> 
> diff --git a/LICENCE.cnm b/LICENCE.cnm
> new file mode 100644
> index 0000000..48d23ea
> --- /dev/null
> +++ b/LICENCE.cnm
> @@ -0,0 +1,23 @@
> +Copyright (C) 2021 Chips&Media, Inc.
> +All rights reserved.
> +
> +Redistribution and use in binary form is permitted provided that the following
> +conditions are met:
> +
> +1. Redistributions must reproduce the above copyright notice, this list of
> +conditions and the following disclaimer in the documentation and/or other
> +materials provided with the distribution.
> +
> +2. Redistribution and use shall be used only with Texas Instruments Incorporateds
> +silicon products. Any other use, reproduction, modification, translation,
> +or compilation of the Software is prohibited.

Is this fw TI specific in any way?
If so, the file name should reflect that.
If not, clause 2 seems overly restrictive. Maaybe something like "... 
shal be used only with products containing C&M Wave5 Codec IP ..." would 
be better?

> +
> +3. No reverse engineering, decompilation, or disassembly is permitted.
> +
> +TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THIS SOFTWARE IS PROVIDED
> +"AS IS" WITHOUT WARRANTY OF ANY KIND, INCLUDING, WITHOUT LIMITATION, ANY EXPRESS
> +OR IMPLIED WARRANTIES OF MERCHANTABILITY, ACCURACY, FITNESS OR SUFFICIENCY FOR A
> +PARTICULAR PURPOSE, SATISFACTORY QUALITY, CORRESPONDENCE WITH DESCRIPTION, QUIET
> +ENJOYMENT OR NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY RIGHTS.
> +CHIPS&MEDIA, INC., ITS AFFILIATES AND THEIR SUPPLIERS DISCLAIM ANY WARRANTY THAT THE
> +DELIVERABLES WILL OPERATE WITHOUT INTERRUPTION OR BE ERROR-FREE.
> diff --git a/WHENCE b/WHENCE
> index 6172b9f..3bf9848 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5718,3 +5718,11 @@ Version: 3.12.1
>   
>   Licence: Redistributable. See silabs/LICENCE.wf200 for details.
>   Originates from https://github.com/SiliconLabs/wfx-firmware
> +
> +--------------------------------------------------------------------------
> +
> +Driver: vpu - Chips&Media, Inc. video codec driver

Driver name should reflect the kernel driver name "wave5"

> +
> +File: cnm/wave521c_codec_fw.bin
> +
> +Licence: Redistributable. See LICENCE.cnm for details.
> diff --git a/cnm/wave521c_codec_fw.bin b/cnm/wave521c_codec_fw.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..ad6710bba4fa98d815edbe9ce80cbe9c1f19d698
> GIT binary patch
> literal 998720
<snip>
