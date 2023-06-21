Return-Path: <SRS0=UjtC=CJ=baylibre.com=amergnat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8134EB64D7
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Jun 2023 09:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DD26C433C8; Wed, 21 Jun 2023 09:43:00 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10365C433C9
	for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 09:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10365C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so12716162a12.1
        for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687340576; x=1689932576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5GBcmLnyO9lS4NBr/8rAccCIiKtu5RR66Ulq/RkkiE=;
        b=EouuDPxL4n9lFO0cBiaRzm24jdgt8Emsx7GfOcSfY2YFPsMJosdkWq9hlFPRuOn3He
         w8nioFV+AlRQ2LvHIraP/glAQq8e0GYoiIYjamoYGmn5dFCuWtU49aUtrmqIUDh4jD3u
         xfnKQgjeIg8TfhWl2xv32/X9+C8P9S5eqrNfG9RppPcMM+n1NvUA7RtQYF2yD0dJCk9c
         5jESXhsd+yX6jZ55IoEFveSuMpoEoccgvaPC9DJY9KA5P5SwQVNi/fvLLPHqDR22xbar
         4YNrJeBg/ojC8fi7wqJYNqZlve7kITWALxlASb+3UGAedc8dD8kyfvU7e1Zprkjo5PSW
         02Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687340576; x=1689932576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5GBcmLnyO9lS4NBr/8rAccCIiKtu5RR66Ulq/RkkiE=;
        b=jTl1KJpfmLJg6OX+t3IL6QQ2VUbUitf6pLCno9vPtyOnApDiJIcfrTSQjjEhjn7Fel
         bfjBQEoRgy/tbHvGizXfva5/krp/GcK95XGvkcKnFty+oaT+mdtlU8X1l4tFe1Bb2AJ5
         KgR0wC+Sy+B912bkhOfFb7BSAH9W/Ouo+Qlz8IOuywvMT+9lAal2IVf7ekOe9vH3xvNH
         /kU2gSGPiMx5t1XoUo8CjZ6ExacK6fjk19rmL0ujNxs/GmMVCPAyx475J/0Hi5YCy4Bz
         zwINKsUEyk6iJ0FN+UQefabPKodat3g6CHW7nuTpo8MLvjgkCixQxHccSdHO66Sr+GSx
         SnqA==
X-Gm-Message-State: AC+VfDwzhLJAYmSIU+pfCSodXzC4B0DhSfy3AtvmnAYLNB8o6zEON6Nk
	J+9QxbUc2v/l7mDhZyxCXFL63w==
X-Google-Smtp-Source: ACHHUZ5iOhly3GaJctJp5PPZl6BWmLQfk2mo+Y68nqZxEzWI8KUTqCHxqDZrW0/HUoNmJ0E4OEPQLg==
X-Received: by 2002:a05:6402:270d:b0:51a:4451:564d with SMTP id y13-20020a056402270d00b0051a4451564dmr11134073edd.18.1687340576011;
        Wed, 21 Jun 2023 02:42:56 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f10-20020a50ee8a000000b0051823c1a10bsm2340226edr.54.2023.06.21.02.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 02:42:55 -0700 (PDT)
Message-ID: <a6bcad96-6d77-b50a-6b69-5fb6757b424f@baylibre.com>
Date: Wed, 21 Jun 2023 11:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] linux-firmware: update firmware for MT7921 WiFi
 device
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>, jwboyer@kernel.org,
 dwmw2@infradead.org, ben@decadent.org.uk, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 Quan Zhou <quan.zhou@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, linux-firmware
 <linux-firmware@kernel.org>, linux-wireless
 <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <5d30a2ec441a1364a2548c007a94f6f3337b6eb0.1685603641.git.deren.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <5d30a2ec441a1364a2548c007a94f6f3337b6eb0.1685603641.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2023 09:36, Deren Wu wrote:
> Update binary firmware for MT7921 WiFi devices
> 
> File: mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin
> Version: 20230526130917a
> File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
> Version: 20230526130958

Hi Deren,

Can you provide details (fix, improvement, new feature) for these 
updated binaries please ?

-- 
Regards,
Alexandre

