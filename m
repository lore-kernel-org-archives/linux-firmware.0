Return-Path: <SRS0=oFd4=GL=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953D6C433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 22:08:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7153023A9F; Fri,  8 Jan 2021 22:08:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2846023A9D
	for <linux-firmware@kernel.org>; Fri,  8 Jan 2021 22:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2846023A9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610143727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GCL7BmRQWGFddOT7YwvrM+uGMuolQui3kZluiCFL2ZY=;
	b=NsF2SKgkD/SWa+CegILKV8KHNUfYBI2/7oScnKhY9PqMDwkGWtLxYtmImebvtRHRzWWcvJ
	DfFOTnjZflZiJQ8azmQqlT6QJ/AezySKppLfhFCC1X6Vo2nsjhRclQ9ilE+wExeOh6t+9P
	jQ+RIS6Iz0O9yyswtkTqvVhwG6bMKpE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-_YAu8OU_MiywJ2VfuokGZw-1; Fri, 08 Jan 2021 17:08:45 -0500
X-MC-Unique: _YAu8OU_MiywJ2VfuokGZw-1
Received: by mail-ed1-f72.google.com with SMTP id u18so5232698edy.5
        for <linux-firmware@kernel.org>; Fri, 08 Jan 2021 14:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GCL7BmRQWGFddOT7YwvrM+uGMuolQui3kZluiCFL2ZY=;
        b=rB6b1OMK7mUYlf7CPcXKGhhJfp4sKRWsNp9HeTZ/91/lU4T/XSrvXJBQhAq9jXcET0
         kiWKCKam3agO5soceMWjK5ll2huW4IRMCxJPa1FiyOy4ECYObIoQGNlV3Ylri+H9jHy5
         XB/AiE1beQnpsqVz5AljGO3S8p/FJF/1QS3ecmTHCNGCNXt5m5maU8p54VuclHhoHzKa
         VnD5s421pll9C9Ng4wkfHx1IRlROaTvIgqMX0LSA1qVkrPq+y8eKNGojwypaTVcxxdJi
         drLsgQltygWYAzi660OUykzkecZqBQbHxD6xdaWydkNW1x0ZLQsTz589gllLSAWF9d3d
         eU2Q==
X-Gm-Message-State: AOAM5312F9wBzuwZO6AnH45AVWxgMBem9E49VumhYbEFNiZaM7iupZU4
	6shAeIhcIRzodce5yXfopsrjlKKpihzSV+dvuBtIvuhQaMteQR1XLHOA6w17EoLc8NINEVE8jbP
	+IPr2+7N8Jh/APAMOOXXg
X-Received: by 2002:a05:6402:1d18:: with SMTP id dg24mr6531797edb.221.1610143723800;
        Fri, 08 Jan 2021 14:08:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxID0twTu8Oj1RQaIosyQjZKuVFq+4Xu8ldc+a77owmMRyRxUVGTTsfBtMXyFCQ8+UuvWwu+g==
X-Received: by 2002:a05:6402:1d18:: with SMTP id dg24mr6531793edb.221.1610143723672;
        Fri, 08 Jan 2021 14:08:43 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id cb14sm3929314ejb.105.2021.01.08.14.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jan 2021 14:08:43 -0800 (PST)
Subject: Re: [BUG] cypress: Fix link direction
List-Id: <linux-firmware.lore.kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>, linux-firmware@kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Josh Boyer <jwboyer@kernel.org>
References: <20210108204420.1724179-1-jeremy.linton@arm.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <136e2055-c307-5097-385c-fb9a741d9672@redhat.com>
Date: Fri, 8 Jan 2021 23:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210108204420.1724179-1-jeremy.linton@arm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 1/8/21 9:44 PM, Jeremy Linton wrote:
> It appears the link direction was incorrect resulting
> in dangling symlinks. This also causes the brcm devices
> to be unable to find their firmware
> 
> Fixes: 060ad8b3d505e ("cypress: Link the new cypress firmware to the old brcm files")
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
> Cc: Josh Boyer <jwboyer@kernel.org>

<ugh>, thank you for catching this.

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  WHENCE | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 676bb18..cbde48d 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2651,47 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
>  
>  File: brcm/brcmfmac4373.bin
>  File: cypress/cyfmac43012-sdio.bin
> -Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
> +Link: brcm/brcmfmac43012-sdio.bin -> ../cypress/cyfmac43012-sdio.bin
>  File: cypress/cyfmac43012-sdio.clm_blob
> -Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.clm_blob
> +Link: brcm/brcmfmac43012-sdio.clm_blob -> ../cypress/cyfmac43012-sdio.clm_blob
>  File: cypress/cyfmac43340-sdio.bin
> -Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
> +Link: brcm/brcmfmac43340-sdio.bin -> ../cypress/cyfmac43340-sdio.bin
>  File: cypress/cyfmac43362-sdio.bin
> -Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
> +Link: brcm/brcmfmac43362-sdio.bin -> ../cypress/cyfmac43362-sdio.bin
>  File: cypress/cyfmac4339-sdio.bin
> -Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
> +Link: brcm/brcmfmac4339-sdio.bin -> ../cypress/cyfmac4339-sdio.bin
>  File: cypress/cyfmac43430-sdio.bin
> -Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
> +Link: brcm/brcmfmac43430-sdio.bin -> ../cypress/cyfmac43430-sdio.bin
>  File: cypress/cyfmac43430-sdio.clm_blob
> -Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.clm_blob
> +Link: brcm/brcmfmac43430-sdio.clm_blob -> ../cypress/cyfmac43430-sdio.clm_blob
>  File: cypress/cyfmac43455-sdio.bin
> -Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
> +Link: brcm/brcmfmac43455-sdio.bin -> ../cypress/cyfmac43455-sdio.bin
>  File: cypress/cyfmac43455-sdio.clm_blob
> -Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.clm_blob
> +Link: brcm/brcmfmac43455-sdio.clm_blob -> ../cypress/cyfmac43455-sdio.clm_blob
>  File: cypress/cyfmac4354-sdio.bin
> -Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
> +Link: brcm/brcmfmac4354-sdio.bin -> ../cypress/cyfmac4354-sdio.bin
>  File: cypress/cyfmac4354-sdio.clm_blob
> -Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.clm_blob
> +Link: brcm/brcmfmac4354-sdio.clm_blob -> ../cypress/cyfmac4354-sdio.clm_blob
>  File: cypress/cyfmac4356-pcie.bin
> -Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
> +Link: brcm/brcmfmac4356-pcie.bin -> ../cypress/cyfmac4356-pcie.bin
>  File: cypress/cyfmac4356-pcie.clm_blob
> -Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.clm_blob
> +Link: brcm/brcmfmac4356-pcie.clm_blob -> ../cypress/cyfmac4356-pcie.clm_blob
>  File: cypress/cyfmac4356-sdio.bin
> -Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
> +Link: brcm/brcmfmac4356-sdio.bin -> ../cypress/cyfmac4356-sdio.bin
>  File: cypress/cyfmac4356-sdio.clm_blob
> -Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.clm_blob
> +Link: brcm/brcmfmac4356-sdio.clm_blob -> ../cypress/cyfmac4356-sdio.clm_blob
>  File: cypress/cyfmac43570-pcie.bin
> -Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
> +Link: brcm/brcmfmac43570-pcie.bin -> ../cypress/cyfmac43570-pcie.bin
>  File: cypress/cyfmac43570-pcie.clm_blob
> -Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.clm_blob
> +Link: brcm/brcmfmac43570-pcie.clm_blob -> ../cypress/cyfmac43570-pcie.clm_blob
>  File: cypress/cyfmac4373-sdio.bin
> -Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
> +Link: brcm/brcmfmac4373-sdio.bin -> ../cypress/cyfmac4373-sdio.bin
>  File: cypress/cyfmac4373-sdio.clm_blob
> -Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.clm_blob
> +Link: brcm/brcmfmac4373-sdio.clm_blob -> ../cypress/cyfmac4373-sdio.clm_blob
>  File: cypress/cyfmac54591-pcie.bin
> -Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
> +Link: brcm/brcmfmac54591-pcie.bin -> ../cypress/cyfmac54591-pcie.bin
>  File: cypress/cyfmac54591-pcie.clm_blob
> -Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.clm_blob
> +Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
>  
>  Licence: Redistributable. See LICENCE.cypress for details.
>  
> 

