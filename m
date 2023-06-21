Return-Path: <SRS0=UjtC=CJ=baylibre.com=amergnat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDB2EB64D7
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Jun 2023 09:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 740CEC433CB; Wed, 21 Jun 2023 09:44:33 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1098EC433C0
	for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 09:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1098EC433C0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-98802908fedso557790966b.1
        for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687340670; x=1689932670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlQq0fREEwCbN+zg5nWq1emhTmdTchChleyqUPdFjVs=;
        b=RoI96apqYmjKlWTjKN9p6BcyJ5VA/4bq/RqDzYThEy0NTWAwP4iWQC/oU2Pz+jsrWF
         y/AWu2hB+BWqGcMKtXVmEDRQee9CFN9MW5CNkP154XjT82efc2LYyYZh8mG4UOow+sg7
         BY47AJvaDatxyD2z49YFys2s4fQdxOLXmsIOPMLjKnIyeVbBQ/2KHxFaicptBf6YpmXo
         BO/cLdVn0wOXZuAwdnfvYVdz+Z5oq0YTs9eSYX/7WOVjFM4oL3W7vBOjBtxXKbnFTueQ
         OWejhX/40rqyJm3/Cq4Rk47J4+OMZwG+8z65zQoq+84Ha6IBIFZlluyWcIj9VZDsLHdt
         D49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687340670; x=1689932670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlQq0fREEwCbN+zg5nWq1emhTmdTchChleyqUPdFjVs=;
        b=Pie8XhqIblttLIMGN4mYVeI1w/U0dIs91PlpOUnBqMGXven42/KcUvzdFpeL4s66jF
         mVIBo2CYgzBmThc3BjX6BAddFlygESKlTRWKPcNyjN+iPaghjMN/0wtOnhibAJWcA3Yo
         jXprAOvFKK5pOZ81YXU/LaVV0/jOasGO3Tmiem7mMbgPxJ9QVzuWR1B30AMYNRS2OVPM
         T5AlrFNmNt3/dIXyeT2bKd/lz9D89TGes+l2n4xhzUunevSssqRHEZH7n3Szf4m1eIOC
         2u3sQ80MlTl61DFwEVQw5g/T8CKbQVLTi4CF8vKenmha8O5NvFHx+wYcoml70DldqPr7
         11cw==
X-Gm-Message-State: AC+VfDxowQStQLQQNj5nI8U7KT3tnOZnidFl5UYscCIDeLZ9BSLwrx4s
	spwdQd/SKTRldLn5lKfL3Y5udQ==
X-Google-Smtp-Source: ACHHUZ4o1HsVmfldXZuoEWli3WLi9034GhMEw8CEYCXPxvttvyzAbQrtdKKRHkoZZ1vR3ZTq8DvX0g==
X-Received: by 2002:a17:907:3e0a:b0:982:9662:a679 with SMTP id hp10-20020a1709073e0a00b009829662a679mr14357488ejc.9.1687340670186;
        Wed, 21 Jun 2023 02:44:30 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id q25-20020a170906145900b0098503ba0db4sm2878692ejc.149.2023.06.21.02.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 02:44:29 -0700 (PDT)
Message-ID: <eccd35b4-369d-8344-d6e6-476df56c20bd@baylibre.com>
Date: Wed, 21 Jun 2023 11:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] linux-firmware: update firmware for MT7922 WiFi
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
 <2af3edb8178b629af34afbce9c583556fb565081.1685603641.git.deren.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <2af3edb8178b629af34afbce9c583556fb565081.1685603641.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2023 09:36, Deren Wu wrote:
> Update binary firmware for MT7922 WiFi devices
> 
> File: mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
> Version: 20230530123154a
> File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
> Version: 20230530123236


Hi Deren,

Same here. Can you provide details (fix, improvement, new feature) for 
these updated binaries please ?

-- 
Regards,
Alexandre

