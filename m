Return-Path: <SRS0=oFd4=GL=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF58C433DB
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 22:08:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EDFA723AA7; Fri,  8 Jan 2021 22:08:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52A623A9F
	for <linux-firmware@kernel.org>; Fri,  8 Jan 2021 22:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A52A623A9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610143683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UceDY0wPQT7qBDDCuwNSzTkbe770pSBVtnUHrtXE2tc=;
	b=R4eboPDS9kH+flg2IV4+/VAF4sI/v0iDfmh72v5AsNbxZjxu52x25Paom2XKeKaHmRBAm7
	Ye9bAEOTbeIb45/FOJylecMskmVnr0aCAJUjnodKvuuBW7ijZKxqTORwUVFGzDRS7VQRJM
	fYJOjKSrgGcjYMKZY50FJ45IqDE4iao=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-_Pc1VfM_NNyOYybNIS2ryA-1; Fri, 08 Jan 2021 17:08:01 -0500
X-MC-Unique: _Pc1VfM_NNyOYybNIS2ryA-1
Received: by mail-ed1-f72.google.com with SMTP id l33so5247012ede.1
        for <linux-firmware@kernel.org>; Fri, 08 Jan 2021 14:08:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UceDY0wPQT7qBDDCuwNSzTkbe770pSBVtnUHrtXE2tc=;
        b=dA05KuS6Si8ZnS+xycVUPtHDUnS0GkYjvCJbXkoABuqCxPkFERGQCiFIngUfM/F1qk
         qU/6q6Vni5NHEMKhnFrHpQUAV7yb31vrmIicy4HKFNHGJr1EgXJDivzZrIPSN9E9X6T1
         m2zZYU3EJmW2yeJXh/n9au7INepOPSjqK8gGzMLPmoxHk2hu+gVce3shOLFJr1uM47vA
         ki8zivNFlf8uLMPvjCWxJa0nfQwO6/SOBxXK043nPTYICmjdmdzJy4s8owfKEZEEc85p
         UaYIB4M7LVlHesP30rjUmeGN70LjIgkJc0YFwopbq7JKzSutvdv3K7AIiVdKghOIugzj
         2Swg==
X-Gm-Message-State: AOAM530Prz2pleLBcEPbaz8KRwfExcgYbVCkDV9A1wThvn59lApTIZZW
	v9arsqydu/5Nu6ZDGvxxQAVDQBT4toXPXNuUwGTFaO7SXcNpeZctLNScwAQUs+2PYsGOCSP928m
	S6ietHAUNcr18oK4CJgxf
X-Received: by 2002:a50:9310:: with SMTP id m16mr6799538eda.94.1610143680351;
        Fri, 08 Jan 2021 14:08:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIjMLHHEKA/L4xhs8a7jDVBFYX79mSmog/GVBYI4VNc7tn3iJ1X9xkhAzHO2FvORK7aPZo6g==
X-Received: by 2002:a50:9310:: with SMTP id m16mr6799533eda.94.1610143680198;
        Fri, 08 Jan 2021 14:08:00 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id b14sm4254279edu.3.2021.01.08.14.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 14:07:59 -0800 (PST)
Subject: Re: [PATCH] brcm: Link rpi4's wifi with newer DMI string
List-Id: <linux-firmware.lore.kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>, linux-firmware@kernel.org
Cc: pbrobinson@gmail.com, jwboyer@kernel.org
References: <20210108204916.1724298-1-jeremy.linton@arm.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1e3286ac-5953-bc9d-8874-0b99e82129a4@redhat.com>
Date: Fri, 8 Jan 2021 23:07:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108204916.1724298-1-jeremy.linton@arm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 1/8/21 9:49 PM, Jeremy Linton wrote:
> The rpi4 when booted with a full featured
> firmware reports a machine id from SMBIOS/DMI.
> Since that is used to select the firmware we
> need to add a new symlink.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/WHENCE b/WHENCE
> index cbde48d..1f69078 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> +Link: brcm/brcmfmac43455-sdio.Raspberryi\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
>  
> 

