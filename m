Return-Path: <SRS0=fPXw=JZ=gmail.com=zajec5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769ECC433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Apr 2021 20:00:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 27E8E6143B; Wed, 28 Apr 2021 20:00:22 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBFC26143C
	for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 20:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBFC26143C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=zajec5@gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 124so20159025lff.5
        for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WkwP3OmlZfDc9cjbC9rcOBehBa/A6PUdbfUfZAUxnR8=;
        b=tfsElU8Cj3D7e3HPZ3svdY92YWYxn7tffvIaN75+DKQ8pAhhKNkMzhWUMHiGvXwGjC
         PmgW2zWN1GTq0wnOPtmjzBfdntp9tJiCcRjiynLhPlQ7/mVryKIrqXGxnOTOH0PzWyLc
         9TXzpt3ShovOw+KdV8p9xiy4cDCWBeuW5gosIQVlNoUmWUrsXfOMPS8PZKQ04fCXhovE
         L4lLhxruEdoSkhTsdy0GvxVFNCnASv7fxVkBt+qKrwiYs6y/9Ge8qkP/T3a1DXeNNHyv
         1vOS1cxvQZvFmRab1lsEXrbfq4A6lF4DGlpp8cIwUJplGHxM52Hau36mhNruP9WglGJG
         qrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WkwP3OmlZfDc9cjbC9rcOBehBa/A6PUdbfUfZAUxnR8=;
        b=sTW07GSRM/xEVygAVGBLMMerGSBWwd2sKKrGnTE3LCNT3mvcBVnUJOVV2lZzQVRJ9g
         ecMeZXjmsBo9reHZmbOVC8Czb0vgnZd8TLU2H7SqYXDNfhuK7pHZJrUkeKDKXxKmnsun
         zI0XDFQg5F7HUMB2aEyMwQ227T0InbqlOMdQUJWBxccfYyZAlIiT6oUXADMXuHHE7rKm
         lvWFnijRIIFoYbTGfxw9S1tDpfifkRV+eaBDrwbPUiZ81bqvfsrnk+tC4Ak6zRfmTjud
         W6HRiP8MOCEZgNOcm2w2mXwUWXWNcnkE4aCvvpr+ywdr2Fmw22yKVhKF3w7fL4RgBC6m
         A+TQ==
X-Gm-Message-State: AOAM531d8sCFcRW3Ycr6DdU+Io+Z6GMLxL4dI1+NDuzLafkXI+wFpqwA
	Qq3sb/7wU/zvYobs0JbHyBfSDATQvN4=
X-Google-Smtp-Source: ABdhPJzaPKVnlK78R8K4uuSg4U5lmKJhRKc5E+AVtGK8NrK4r4O5qk6taEJD/nSULejYW+rjc5SNLg==
X-Received: by 2002:a05:6512:344d:: with SMTP id j13mr4299538lfr.369.1619640020113;
        Wed, 28 Apr 2021 13:00:20 -0700 (PDT)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id y14sm165696ljy.18.2021.04.28.13.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 13:00:19 -0700 (PDT)
Subject: Re: [PATCH] brcm: Add a link to enable khadas VIM2's WiFi
List-Id: <linux-firmware.lore.kernel.org>
To: Jian-Hong Pan <jhp@endlessos.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@endlessos.org
References: <20210428083230.8137-1-jhp@endlessos.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <c62e9f94-25fc-6791-c328-5454abc403b9@gmail.com>
Date: Wed, 28 Apr 2021 22:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210428083230.8137-1-jhp@endlessos.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 10:32, Jian-Hong Pan wrote:
> According to kernel message on khadas VIM2 board equipped with BCM4356:
> 
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
> usbcore: registered new interface driver brcmfmac
> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.khadas,vim2.txt failed with error -2
> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.txt failed with error -2
> 
> System needs the NVRAM file "brcmfmac4356-sdio.khadas,vim2.txt" to enable
> the WiFi. After test, found it can share with the same file
> "brcmfmac4356-sdio.vamrs,rock960.txt".

Please elaborate: what test exactly?
