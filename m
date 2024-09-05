Return-Path: <SRS0=nNTa=QD=gmail.com=jirislaby@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E1CD4F50
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Sep 2024 04:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FCAFC4CEC5; Thu,  5 Sep 2024 04:53:07 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8680CC4CEC4;
	Thu,  5 Sep 2024 04:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8680CC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86b46c4831so57999766b.1;
        Wed, 04 Sep 2024 21:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725511985; x=1726116785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CNARd/pCzU6pKn9F8Gv6lJ3/gFiWNyoTSPfRN0h7sI=;
        b=GSlssyqjR+pKm9bVhm9YIYwa/De0iz98moKfiZ+ZeH45w/nev/NWbs2dMFY6dDaH87
         fd/HMyQ2TTia956f40vRVDF3pR6lwVf57wjGwZAqFAvuSB4Uqglw1WPxU3eaMW+WIqeM
         uoV1w5+Q8m3xSNhyJv3J7G5UpZ+DAcht6cOWFtfDxJiIoCqKcZr6mzn2aomtsqEr2Io4
         EkYB/EhZrd3bR4CB05Uh1iChe9SrjqOTyFrNcrc3dU+i+elDkrDIPtkbW5ctKSM38WLQ
         lcP0Esj5y+AKELAUGng5rfyjz5JhlFmysRwKwLHU+ab49KrZTWmzLnL4kUlkzXsXPizB
         1gng==
X-Gm-Message-State: AOJu0YzK06PoRs5PjQ6JX+VrLGuYsdztbtqi3nhm8mwKjIpUVDysflTR
	m+KkIa8rPlL7NzCDMOusuBTi92mheoFRvX4ZvYpAZc07lfsbMNByW3e5JhIS
X-Google-Smtp-Source: AGHT+IHySmdI+NfyTDzhjpDr2nB1a5Yk0YgNT3cITP3U25vBP+VObHTYEMv8r2YAH+PDDlT6rmAZpg==
X-Received: by 2002:a17:907:934d:b0:a88:a48d:2bdc with SMTP id a640c23a62f3a-a89d6b05675mr1293252866b.0.1725511984381;
        Wed, 04 Sep 2024 21:53:04 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6236d164sm76437966b.111.2024.09.04.21.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 21:53:04 -0700 (PDT)
Message-ID: <fbffc619-10a6-42f1-9957-e662db6eb790@kernel.org>
Date: Thu, 5 Sep 2024 06:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: brcmfmac434*6 firmwares inclusion
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Arend Van Spriel <arend.vanspriel@broadcom.com>
References: <9b5a5238-0e08-41e5-9cc0-346b446e0562@kernel.org>
 <CA+5PVA4epRwKqZmhX6deEBC35Ks9D1toRpLQgu1m=W5+hET1LA@mail.gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <CA+5PVA4epRwKqZmhX6deEBC35Ks9D1toRpLQgu1m=W5+hET1LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

CC Arend

On 04. 09. 24, 13:36, Josh Boyer wrote:
> On Wed, Sep 4, 2024 at 1:27 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>
>> Hi,
>>
>> would it be possible to incorporate these broadcom firmwares:
>>     https://github.com/bsdkurt/brcm-supplemental
>> into linux-firmware.git?
>>
>> The license appears to be the same as:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENCE.broadcom_bcm43xx
> 
> The license being similar is not enough.  There's nothing that would
> indicate the bsdkurt repo obtained those firmware files from Broadcom
> in a manner that intended for them to be redistributed.
> 
> We'd need a submission from someone at Broadcom with a signed-off-by.

Ok, so I copy Arend who added most of brcm's .bin files: Can you help 
with this, please?

>> It would fix:
>> https://bugzilla.suse.com/show_bug.cgi?id=1201112

thanks,
-- 
js

