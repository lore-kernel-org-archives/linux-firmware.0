Return-Path: <SRS0=gq6V=JF=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE48C433B4
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Apr 2021 09:15:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6DE0461157; Thu,  8 Apr 2021 09:15:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB3C6113A
	for <linux-firmware@kernel.org>; Thu,  8 Apr 2021 09:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB3C6113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617873338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LG3F5t41Md6oy4dEp3SWV7WpfWf8g5JLENySth8ajew=;
	b=bTYI3KdMpHsg65OnNUWdS9LwiTpvGvMzRrvFSrxTM0PfGU0zR57xvk51FudCo28l5SsODn
	DxYZFlMpYq8cEY/wAS5vZy2Bc8NiswyUZRDk4rfUu5nga96XxbWBjQv29SuuoRfg2GkVwP
	O6gDjntvJ3BRU67MC66Wvqvzgozvcfo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-WdRNJRCxOTqn0KArkwl6wQ-1; Thu, 08 Apr 2021 05:15:36 -0400
X-MC-Unique: WdRNJRCxOTqn0KArkwl6wQ-1
Received: by mail-ed1-f70.google.com with SMTP id a8so726927edt.1
        for <linux-firmware@kernel.org>; Thu, 08 Apr 2021 02:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LG3F5t41Md6oy4dEp3SWV7WpfWf8g5JLENySth8ajew=;
        b=ZUyuLR0zMa9OQyl9VZ/F1BAWnbCrKFH9Q+gH+EK2fvv1TyDjeju/pDKtPEmQe0Xhkk
         544uAE52NgZmrqFh5n06gjm3/bnYlWK5GOGm7DPWi58LFRWGh9qfOonBvONd7C9Zk40G
         ZyqYZw/QCPxgv99ThkyiuCFAJ5jz74hWDsKC92WQ/o/hGTU620+DErFXhm29npFKk/Z3
         5Ic8+YvrhvgQJcfVGinMIWEg16hRNKVY/5+JQqCxjQCsEE5NaxbHvZTX43Yfr+fh05KM
         dCGsbyStxyH/02of0cOKLBsN3fAfPcB7zwzkCXHbGkVLZpaZXk9f9udboZ0Fn9JoHW3O
         iggw==
X-Gm-Message-State: AOAM530vpwupVZEZ8QQuZQ3MgeWZ+wjgPeCQ75DhwKgY6fJ3LxIFVg69
	GCS4Gy2He5adji9pTn6jM8Ka1tRblvtyBNLdgumbx8Wwgf9erIzFAoq6LR7oJ67VU4jeOw2lQlp
	CYfyH9zldyyx5qxz1i3aP
X-Received: by 2002:a17:907:1049:: with SMTP id oy9mr9005103ejb.431.1617873334919;
        Thu, 08 Apr 2021 02:15:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycRll/saSkJ6VFuFbM/WQw5xPb090/V2sP+xLj1afXem8eImssz4OqS/2/OF5haZUzhK426g==
X-Received: by 2002:a17:907:1049:: with SMTP id oy9mr9005088ejb.431.1617873334769;
        Thu, 08 Apr 2021 02:15:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n10sm3466788ejg.124.2021.04.08.02.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 02:15:34 -0700 (PDT)
Subject: Re: [PATCH] brcm: Link CM4's WiFi firmware with DMI machine name.
List-Id: <linux-firmware.lore.kernel.org>
To: jlinton <jeremy.linton@arm.com>, linux-firmware@kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>, Josh Boyer <jwboyer@kernel.org>
References: <20210408032554.5836-1-jeremy.linton@arm.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3a446883-958d-4465-0a68-6b757ad2d694@redhat.com>
Date: Thu, 8 Apr 2021 11:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210408032554.5836-1-jeremy.linton@arm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 4/8/21 5:25 AM, jlinton wrote:
> From: Jeremy Linton <jeremy.linton@arm.com>
> 
> The kernel when booted in ACPI mode with SMBIOS/DMI
> data uses the DMI data to set the machine
> manufacture/model.
> 
> The WiFi driver uses the machine string to select the
> correct firmware image. Because of this, an additional
> link to select the correct firmware is needed.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Josh Boyer <jwboyer@kernel.org>
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
> index aa96404..1eaee0b 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2723,6 +2723,7 @@ File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
>  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> +Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
>  File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
> 

