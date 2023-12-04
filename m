Return-Path: <SRS0=b0Qj=HP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F97CC10DC1
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Dec 2023 22:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3ABB2C433CA; Mon,  4 Dec 2023 22:12:51 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D9FAC433C8
	for <linux-firmware@kernel.org>; Mon,  4 Dec 2023 22:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D9FAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-2c9f62447c2so22140971fa.0
        for <linux-firmware@kernel.org>; Mon, 04 Dec 2023 14:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701727968; x=1702332768; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/XwNBoL4Bepsl7g/sWBiJeFXT6UQOp8xSka7hcO9do=;
        b=RFNwM3DUcJStcZMTE3q75BvhRbRJdSsypeKQCM9Cx4539OlL7J+I0ANOlbINQotfrc
         cqd2ZZR31MBuLxWmo8gr+3AE//cfJ2EaN7+I8w65DK7G8EBtHnbuk9H5HlFbRSI7lmeI
         UiAE8zoPuvGelA54yvrIih1bcG6Sy6Why3fWfLgt1LNsokKXQ7Fpo54FCVewYCZFRv0G
         W6RKoLWjHyaPLYUOOVSAUJrdUZmX44g7WNYuFL/8bf74SLPEtumbaSZ6j/adAaWgAMER
         7Cmjb2YYQS+/OZVbuDRpGBbZpbjF+kX0Dzuu3rmB1Irg4wCQ+TUCVKK91H249DpwZlKp
         GRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701727968; x=1702332768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/XwNBoL4Bepsl7g/sWBiJeFXT6UQOp8xSka7hcO9do=;
        b=GwM8pnsD7ik4H3ia4KSRsxQhfQDy2Ygc8FxLsCc8yOzHfOokA+otrU62YQXVBYIq8I
         E4sAsusC/5Sb4ysjnGJeTS02fszaz/u5UrDaStuX1/pCYg8/Y/KUBpXqUcQek1U0Jpri
         oY+0xvqCpT4sza+8q/kzF5T4l+iaaBTI9hMF8FS86fUyFsp9WPNwS1RsdaxiqsxPNurn
         2Caog+pVr58W+rwUxKmudeK2+azxpte1IoPPfhZCuW7VFD78DHlwSXQtLF0/qqa3aVU1
         jZ+qViT1ZcVcduC83gfENIutoBkiBBC+cZGtKP6FkrcnA5sepVSLTY8/umgBTIuF+BK4
         0eJg==
X-Gm-Message-State: AOJu0YwQIM9HzUt5OfHG/LWpLPBMcfcjxMVHEpF3zv1eK0veYBT8Ep4M
	12hFrdftG3ZlhfEU5EPo660bZxAwcaB2lpFk7uKSu5UjSVI=
X-Google-Smtp-Source: AGHT+IGHK8eaCUSqMAX1OhYsPV0pIhUbSjJMFerqkfAyQ/4Q38mzcJW2EMzEaVIIajQnD8anvfh8Gg==
X-Received: by 2002:a2e:a413:0:b0:2ca:92a:c109 with SMTP id p19-20020a2ea413000000b002ca092ac109mr232770ljn.24.1701727968171;
        Mon, 04 Dec 2023 14:12:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id a39-20020a2ebea7000000b002c9f70a0419sm746817ljr.140.2023.12.04.14.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 14:12:47 -0800 (PST)
Message-ID: <f8cf9a21-ef2b-48c6-86b3-ff8874c87b8b@linaro.org>
Date: Tue, 5 Dec 2023 00:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: add firmware for en8811h 2.5G ethernet
 phy
To: Sky Huang <SkyLake.Huang@mediatek.com>, John Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware <linux-firmware@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Steven Liu <Steven.Liu@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 "Lucien . Jheng" <lucien.jheng@airoha.com>
References: <20231130134610.31342-1-SkyLake.Huang@mediatek.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231130134610.31342-1-SkyLake.Huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/11/2023 15:46, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch adds firmware files for airoha en8811h 2.5G ethernet phy.
> Refer to https://www.airoha.com/products/p/tKkm7DPXi5m6wY2D for more
> product information.
> 
> Signed-off-by: SkyLake.Huang <skylake.huang@mediatek.com>
> Signed-off-by: Lucien.Jheng <lucien.jheng@airoha.com>
> ---
>   LICENSE.airoha         |   9 +++++++++
>   WHENCE                 |   9 +++++++++
>   airoha/EthMD32.DSP.bin | Bin 0 -> 131072 bytes
>   airoha/EthMD32.dm.bin  | Bin 0 -> 16384 bytes
>   4 files changed, 18 insertions(+)
>   create mode 100644 LICENSE.airoha
>   create mode 100644 airoha/EthMD32.DSP.bin
>   create mode 100644 airoha/EthMD32.dm.bin
> 
> diff --git a/LICENSE.airoha b/LICENSE.airoha
> new file mode 100644
> index 00000000..160058b7
> --- /dev/null
> +++ b/LICENSE.airoha
> @@ -0,0 +1,9 @@
> +Airoha Inc. grants permission to use and redistribute aforementioned firmware
> +files for the use with devices containing Airoha chipsets, but not as part of
> +the Linux kernel or in any other form which would require these files themselves
> +to be covered by the terms of the GNU General Public License or the GNU Lesser
> +General Public License.

This doesn't allow redistributing these firmware files for other use 
cases. Thus, I fear, generic purpose distributions will not be able to 
pick up these files. But please note, I'm not a lawyer.

> +
> +These firmware files are distributed in the hope that they will be useful, but
> +are provided WITHOUT ANY WARRANTY, INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTY
> +OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.

-- 
With best wishes
Dmitry

