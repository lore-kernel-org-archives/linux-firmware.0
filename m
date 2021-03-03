Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MONEY_NOHTML,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8F3C433E0
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Mar 2021 18:50:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1F19664EEC; Wed,  3 Mar 2021 18:50:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC15564EE1
	for <linux-firmware@kernel.org>; Wed,  3 Mar 2021 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614797447;
	bh=mkAFDNHyhQNLsbIJqHwi4Ib3so+oZlyMB0TEy+tRJy8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qToD91T9JeW9NZ3dEzJ+eOwLC8OfAnTm3n5OhNadRqn2VVuLgGQ+pSYK0f/3zjQVE
	 /klx6UGWSLIMrPD7JEfhPfK9RjvZ8anA/NltmKsScIBganIOHOVLcm0zLhjMY+JH+X
	 xJNFppAzRK4zEaUAb71Oq/Y6gYaRXRxmqzQiygKm5Um+ZLCu6N+LohTfy0st8pQMzi
	 YUSksLUs4kplfW8q2JhYTSZOv8fa3WuBYS1x/sfHxLAx6d5+yVsBL7+16D1oQr8hjk
	 k2mvBxOEYFvVlwgKXB1WPsaMNgL4GcFROq8BhLCOG8g7hdab1uLvWZ2VL55uL5noW/
	 tveaCPK7kOhjw==
Received: by mail-io1-f45.google.com with SMTP id 81so23222177iou.11
        for <linux-firmware@kernel.org>; Wed, 03 Mar 2021 10:50:46 -0800 (PST)
X-Gm-Message-State: AOAM5333uIPI4NmTsH8tfdvoREYLHCBVbCjGy+PapjcY9XGfLxJmKWL2
	WzyLfqmhgf88xWCIOVOvdr8Wfm2Zj184o0xbDM0=
X-Google-Smtp-Source: ABdhPJzk/igO1eplNvQbnKLBLQv4IySmfn2AIk32vSpXfnEhPVpxRTI68KtVB8XZ78zH//HUJiWVaRdcjDFHmDetUWM=
X-Received: by 2002:a5d:9d01:: with SMTP id j1mr459437ioj.195.1614797445721;
 Wed, 03 Mar 2021 10:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20210226132057.120007-1-srini.raju@purelifi.com>
In-Reply-To: <20210226132057.120007-1-srini.raju@purelifi.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 Mar 2021 13:50:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7okASXRaiA8LoNp1gVHAd7iDPvzXsr1x2rBkh=4-VZXA@mail.gmail.com>
Message-ID: <CA+5PVA7okASXRaiA8LoNp1gVHAd7iDPvzXsr1x2rBkh=4-VZXA@mail.gmail.com>
Subject: Re: [PATCH] [v6] linux-firmware: New firmware files for pureLiFi USB devices
To: Srinivasan Raju <srini.raju@purelifi.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, 
	mostafa.afgani@purelifi.com
Content-Type: text/plain; charset="UTF-8"

Is the driver reviewed and merged now?  If so, Kallle (or whomever)
can you provide a Reviewed-by?

josh

On Fri, Feb 26, 2021 at 8:22 AM Srinivasan Raju <srini.raju@purelifi.com> wrote:
>
> This patch adds new firmware files for pureLiFi LiFi-X, LiFi-XC, LiFi-XL
>
> Internal revisions:
>         Firmware: 17180
>
> Signed-off-by: Srinivasan Raju <srini.raju@purelifi.com>
>
> ---
> v6:
>  Firmware files renamed to lowercase
> v5:
>  Updated directory structure to match wireless-next submission
> v4:
>  Updated to latest firmware (version 17180)
> v3:
>  Added README and changed firmware names to match products
> v2:
>  Added Signed-off-by and typo corrections
> v1:
>  Initial submission
> ---
>  LICENCE.purelifi_firmware |  29 +++++++++++++++++++++++++++++
>  WHENCE                    |  11 +++++++++++
>  plfxlc/README             |   7 +++++++
>  plfxlc/lifi-x.bin         | Bin 0 -> 3825907 bytes
>  plfxlc/lifi-xc.bin        | Bin 0 -> 3825906 bytes
>  plfxlc/lifi-xl.bin        | Bin 0 -> 70228 bytes
>  6 files changed, 47 insertions(+)
>  create mode 100644 LICENCE.purelifi_firmware
>  create mode 100644 plfxlc/README
>  create mode 100644 plfxlc/lifi-x.bin
>  create mode 100644 plfxlc/lifi-xc.bin
>  create mode 100644 plfxlc/lifi-xl.bin
>
> diff --git a/LICENCE.purelifi_firmware b/LICENCE.purelifi_firmware
> new file mode 100644
> index 0000000..4d3d12d
> --- /dev/null
> +++ b/LICENCE.purelifi_firmware
> @@ -0,0 +1,29 @@
> +Copyright (c) 2021, pureLiFi Ltd.
> +All rights reserved.
> +
> +Redistribution.  Redistribution and use in binary form, without
> +modification, are permitted provided that the following conditions are
> +met:
> +
> +* Redistributions must reproduce the above copyright notice and the
> +  following disclaimer in the documentation and/or other materials
> +  provided with the distribution.
> +
> +* Neither the name of pureLiFi Ltd nor the names of its suppliers
> +  may be used to endorse or promote products derived
> +  from this software without specific prior written permission.
> +
> +* No reverse engineering, decompilation, or disassembly of this
> +  software is permitted.
> +
> +DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> +CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
> +BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> +FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
> +THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
> +BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
> +OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> +ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
> +TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
> +USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/WHENCE b/WHENCE
> index aa96404..12a14f8 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5338,3 +5338,14 @@ Driver: lt9611uxc - Lontium DSI to HDMI bridge
>  File: lt9611uxc_fw.bin
>
>  License: Redistributable. See LICENSE.Lontium for details.
> +
> +--------------------------------------------------------------------------
> +
> +Driver: purelifi - Driver for pureLiFi LiFi USB Devices
> +
> +File: plfxlc/lifi-x.bin
> +File: plfxlc/lifi-xc.bin
> +File: plfxlc/lifi-xl.bin
> +File: plfxlc/README
> +
> +Licence: Redistributable. See LICENCE.purelifi_firmware for details.
> diff --git a/plfxlc/README b/plfxlc/README
> new file mode 100644
> index 0000000..346891a
> --- /dev/null
> +++ b/plfxlc/README
> @@ -0,0 +1,7 @@
> +LiFi STA firmware for pureLiFi X, XC, and XL USB devices
> +
> +Place the .bin files in /lib/firmware/plfxlc
> +
> +mkdir -p /lib/firmware/plfxlc
> +
> +cp <firmware> /lib/firmware/plfxlc
> diff --git a/plfxlc/lifi-x.bin b/plfxlc/lifi-x.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..df004a8708670e399e888a0627f4a6cc8730f849
> GIT binary patch
> literal 3825907
> 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
