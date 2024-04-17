Return-Path: <SRS0=tm4Z=LW=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D2DC4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 14:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BD97C116B1; Wed, 17 Apr 2024 14:14:44 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58B41C072AA
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 14:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58B41C072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5ac5376c4b2so3469940eaf.2
        for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713363282; x=1713968082; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjawpEZOcDH/6R+eopMAGA1z4x5Ko0AY4+QCsVzXPgQ=;
        b=eIjeBUQDZMg7SN5DMQMHbTviiAnGED33TrIuHGFygIWkiTLT+rle/+5StLFcDHL0nv
         roQAeP66Gj7QEngoxPWnL+M49UV7dr0q1UccrWzYs1TbWZgtYyeUkCUPzfhxMRGQ2wEU
         cKdqt1kmZb4ZwKNSiQawav1UrX3x7RB2didQBKMRIKBIBDq6g+WKXpCkA4CDyBH83jBh
         MZR+hSWPASVsN/gXhL/waO5PuiyUzt0EaWGZ1UrkZvZayr1VFU0276h25bpZ1X7jjEZt
         s688vYIsVgm405qB3+jiQysEWGBJErAH9fmV8pjdMPNDUNzjZZDDTJFs1aObHqhoIkJ7
         RR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713363282; x=1713968082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjawpEZOcDH/6R+eopMAGA1z4x5Ko0AY4+QCsVzXPgQ=;
        b=PPcIDaboYa4XeEOY1RLkBnFzLWf2bGtY37Iweh1pIrtTml9MZmrOQcJRk+9Zt1qvnp
         EG7hlfvNBrMrsg0q4h6fTkrmWCOTygCsn6GXOz3ElAWRiXLugH3ejRR5zCr7F2jNuOtf
         pUbgcnXA8bkOQYUbGCeXeIODk7XNE+A9lCYIH4DOpuir+4o+AEErc78VD/nDWOySKSyG
         UHpmfs/DWbcPOSLeLMkhfm2SGsvEAe/dtCSUrE/Dwejo36sUxCTAXsy5kYKHWhZpISoo
         WPJKM0OuT1fair3zTWQiP+yXH2PtEPvUXwMYdS6rpHETf27KonkNCAX4F8eMj8qC20NF
         5erQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHkjMybUBKr4WPvRF/XA67blW5B/A795MfUdj8GxCBDHEwmTOhkkMGIaOED/26IaROV1ijJzQQhS2WnYideAzeQfwPdFordnCZ
X-Gm-Message-State: AOJu0Yyypa87nh6Ph2QS/ckT6zxGjUyfx2H65ucwEAiuC9sZZ8SHIq+n
	V1bcng+ktIT9zGHbt+tps5E734AqTaIkDQoUAocBKIuyyCWWxn6T
X-Google-Smtp-Source: AGHT+IE+ue6diJmzXmTPNAmaD2gap1v+6Y50xqsM5TCQVPDQ0//1F+etzxC8z/etHBZhebo/yqYB0g==
X-Received: by 2002:a05:6820:c13:b0:5ac:6891:cee7 with SMTP id eh19-20020a0568200c1300b005ac6891cee7mr13334930oob.3.1713363282337;
        Wed, 17 Apr 2024 07:14:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f702:9c77:c230:a0ba:a1a1? ([2600:1700:70:f702:9c77:c230:a0ba:a1a1])
        by smtp.gmail.com with ESMTPSA id v18-20020a4a8c52000000b005acd675194asm647068ooj.8.2024.04.17.07.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 07:14:42 -0700 (PDT)
Message-ID: <9f0163ae-75bc-4a65-bc92-c9ae181ad83c@gmail.com>
Date: Wed, 17 Apr 2024 09:14:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: putting future iwlwifi firmware into intel/ ?
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
References: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
 <9aa64d50-cb4d-4118-bc27-86c23410ff8b@gmail.com>
 <f65765b29ea7503fbbaa5e047c95a82de6fc2083.camel@sipsolutions.net>
 <b0e70576-a53f-4d03-a503-ddf1f98bbe9d@gmail.com>
 <b712f48a3e35221b7ff7f4c8cb495b5159bdd367.camel@sipsolutions.net>
 <b7876373-08d9-4948-a49a-e79f42f3abcb@gmail.com>
 <2278e0d1026ed336559adbc9ffbf6e945eba422e.camel@sipsolutions.net>
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <2278e0d1026ed336559adbc9ffbf6e945eba422e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/24 09:09, Johannes Berg wrote:
> On Wed, 2024-04-17 at 08:58 -0500, Mario Limonciello wrote:
>>>
>>> Yeah, I guess. Though not actually sure, do we need to support new
>>> kernel + old firmware install?
>>
>> I'd say you should.  Here's a few examples of why:
> 
> Right, agree.
> 
>> So yes; do the symlinks when you move directories.  It's one line in
>> WHENCE per file that you want a symlink.
>>
> 
> That doesn't achieve it though. It means the driver needs to try for the
> file in intel/ and then fall back without the intel/ if it's not found.
> 
> Or just look for new files in intel/ and old files without intel/, but
> then you don't really need the file move/symlinks?
> 
> johannes

It's probably easiest to look in intel/ and then fallback to the 
toplevel path if -ENOENT and try again.

Like Kalle mentioned, wait a few years and then tear out the fallback 
code and the symlink creation.
