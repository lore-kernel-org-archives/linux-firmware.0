Return-Path: <SRS0=g1ds=EW=gmail.com=larry.finger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F5BC2D0A3
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Nov 2020 17:35:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CD0F6222E8; Mon, 16 Nov 2020 17:35:02 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F252225E;
	Mon, 16 Nov 2020 17:35:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0LVJHxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F252225E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=larry.finger@gmail.com
Received: by mail-oi1-f193.google.com with SMTP id q206so19585515oif.13;
        Mon, 16 Nov 2020 09:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KF2UZRrwC1HlcKbIsDf+i5LPHa6Z8I4vPzJHQ4amTIw=;
        b=p0LVJHxYG0liG+Pkw5WjmUBMTaH7ugxQb1e5zMIOTgWgMIzBKmpIskAG3Ksm+h8I+j
         yiXd1/C0A9u+3Iqa57lSdpdrUT6WSBvD712k8mtssWs18AQZuNV6Vjv997YHcMXjGMMR
         u4GABahg7/zslba4HPLlMTjTYt+rIIC1Z1OdCOEt2pnpbVbhuwv4POiAZNZj690FzPK+
         RtIDhRmAlQZH9GgLufUhXfGAFMm339dlolBw0c8cIfv8oBFOp+BnL466alBhYTupIXae
         qFnDwyTnk+CgjrpGxmCAtf5ctwzU2Y92+WA2ARwb/TrZGP/bug5TRGB1f80GaIO3rkx9
         GxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KF2UZRrwC1HlcKbIsDf+i5LPHa6Z8I4vPzJHQ4amTIw=;
        b=O8nDzS5DWAE3F2IRHH2YrB9jHPdn5Bvwb7ZU8QnchhTzPjptYb3x9Ml7HiR2A+1l3e
         lGP8Jsr3qBtxIPEmVU5ty5NYKfjR5/BOW7Ufacca6CEGKHmsP9kZkSXhUhNkOb8dJzlk
         S9LkgIeacQKvnFTom8wNlDF3ResBs6VR1SywfsuSf+tg3H0AONG/zFG9cfIp/l8NugTk
         j+UHCRqo3lHJJddUibIQ9yrxGTqYvupYUkbHXpnmq/yDrx+CuG44fi2Vy++lb1dvUUEB
         n5c2L1jS78EvtnUdC2EXvqxw0zmHvysKhgl/8SXaS84M07ow0UFaFoFLEeFFfMLxqFtc
         oelg==
X-Gm-Message-State: AOAM531em+A+7jrxGU7nyefN/cokWvtID/T/bO3u9qC0Z45UXK41GYax
	9omB6SlcWzvEBFKF1Y43JkwXVhnPYD4=
X-Google-Smtp-Source: ABdhPJySqK0xvDycYF0hxgRASbz/YRRl61qNuM5FCCvABNLtyVKsA0Sf3vmGyu8sbEoDwqQbz6YZeg==
X-Received: by 2002:aca:6206:: with SMTP id w6mr388974oib.121.1605548101009;
        Mon, 16 Nov 2020 09:35:01 -0800 (PST)
Received: from localhost.localdomain (cpe-24-31-245-230.kc.res.rr.com. [24.31.245.230])
        by smtp.gmail.com with ESMTPSA id w70sm4882792oiw.29.2020.11.16.09.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 09:35:00 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
List-Id: <linux-firmware.lore.kernel.org>
To: hildawu@realtek.com, linux-firmware@kernel.org
Cc: jwboyer@kernel.org, max.chou@realtek.com, alex_lu@realsil.com.cn,
 hsinyu_chang@realtek.com, kidman@realtek.com
References: <20201116055438.6048-1-hildawu@realtek.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <e9a95a6d-37d8-8d2c-b0f4-2cd22927d00d@lwfinger.net>
Date: Mon, 16 Nov 2020 11:34:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116055438.6048-1-hildawu@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/20 11:54 PM, hildawu@realtek.com wrote:
> From: Hilda Wu <hildawu@realtek.com>
> 
> This firmware patch update for Realtek RTL8822C BT controller.(UART I/F)
> 
> Release Version:0x059A_25CB
> 
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>   rtl_bt/rtl8822cs_fw.bin | Bin 58640 -> 60956 bytes
>   1 file changed, 0 insertions(+), 0 deletions(-)

You need to add this change to WHENCE. NACK

Larry
