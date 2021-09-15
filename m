Return-Path: <SRS0=8JkX=OF=gmail.com=vicamo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D32FC433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Sep 2021 04:52:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1942961157; Wed, 15 Sep 2021 04:52:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B3E60F23;
	Wed, 15 Sep 2021 04:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7B3E60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id n4so857705plh.9;
        Tue, 14 Sep 2021 21:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yGHbYJBuSG9UZHDjC7+kOc8HYDQH3BClMCgGkanPURQ=;
        b=z3lfQbljLq+PP5GP9vLwMtldWp9B91AUtrO1o7W8UX1gWt4b4JQz/wCtq4beK9aYtx
         3dCiGyy2/z/Im5dxtfkbLOsNSbr9H5yK1yudKO8jelYWuClOwqetrtr8bvj7iHr+Is/o
         DXeLOMi6NRo+XMxeurYa5nngsJqjzMMzlUMPbCsiUBzxrZrcxsxy+viULb1/vZ5sBEO3
         hv+NjUUnA/ZkJJNQxWevGzWSJNojVbsoZT2ojgFm9mfIEv609wELPXOLW6Gky2DfZGxk
         ReKXBkUzc/o4lCaN2ntOCC4NTzOaVE11C9C1E4tr4wXMHFMH2fDeE28XAn9IRT2Trb7+
         vY/w==
X-Gm-Message-State: AOAM532WPUCeNg9cGSTpnEziHnvLqkTP3FdT1581LmHNvS1DBUof/nMN
	7WG9bsb3nlDLJCtBUl0aZrq4euvIrbNDDQ==
X-Google-Smtp-Source: ABdhPJxzdU+aGkSqmBgUR56W1EyHuhE2pzhs8apYKL6Z2f2tWkFu7NxDKQzogJ4iC6V0ti40epEJ4w==
X-Received: by 2002:a17:90a:9292:: with SMTP id n18mr6240214pjo.120.1631681553131;
        Tue, 14 Sep 2021 21:52:33 -0700 (PDT)
Received: from [192.168.0.242] (218-173-145-126.dynamic-ip.hinet.net. [218.173.145.126])
        by smtp.gmail.com with ESMTPSA id o5sm3024718pjg.40.2021.09.14.21.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 21:52:32 -0700 (PDT)
Subject: Re: pull request: iwlwifi firmware updates 2021-09-14
List-Id: <linux-firmware.lore.kernel.org>
To: Luca Coelho <luca@coelho.fi>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kyle@infradead.org" <kyle@infradead.org>,
 "jwboyer@kernel.org" <jwboyer@kernel.org>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
References: <cf74966169f716164a7e642edc1aae8cdb7417c6.camel@coelho.fi>
From: You-Sheng Yang <vicamo.yang@canonical.com>
Message-ID: <945c6e9d-6635-7039-c876-260df26ee3d2@canonical.com>
Date: Wed, 15 Sep 2021 12:52:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cf74966169f716164a7e642edc1aae8cdb7417c6.camel@coelho.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/14/21 4:19 PM, Luca Coelho wrote:
> Hi,
> 
> 
> This pull request contains a single patch that adds firmware binaries
> to support one more device family in iwlwifi, namely So SOCs with Gf,
> Hr and Jf radio modules.  This replaces the previous patch that we
> reverted.
> 
> Please pull or let me know if there are any issues.
> 
> --
> Cheers,
> Luca.
> 
> 
> The following changes since commit 090a34dfe32bfe139bf0f8df96bcbce320ee8864:
> 
>   linux-firmware: add frimware for mediatek bluetooth chip (MT7922) (2021-09-13 11:35:49 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-09-14
> 
> for you to fetch changes up to 22cfb96ad56e7c0fdee96550ce9612981dc8342d:
> 
>   iwlwifi: add FWs for new So device types with multiple RF modules (2021-09-14 11:11:43 +0300)
> 
> ----------------------------------------------------------------
> Add iwlwifi firmware binaries for So with Gf, Hr and Jf.
> 
> ----------------------------------------------------------------
> Luca Coelho (1):
>       iwlwifi: add FWs for new So device types with multiple RF modules
> 
>  WHENCE                       |  11 +++++++++++

This adds incorrect filenames. The `a0-hr-a0` and `a0-jf-a0` should be
`a0-hr-b0` and `a0-jf-b0` instead.

>  iwlwifi-so-a0-gf-a0-64.ucode | Bin 0 -> 1515812 bytes
>  iwlwifi-so-a0-gf-a0.pnvm     | Bin 0 -> 41804 bytes
>  iwlwifi-so-a0-hr-b0-64.ucode | Bin 0 -> 1427384 bytes
>  iwlwifi-so-a0-jf-b0-64.ucode | Bin 0 -> 1365628 bytes
>  5 files changed, 11 insertions(+)
>  create mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0.pnvm
>  create mode 100644 iwlwifi-so-a0-hr-b0-64.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-64.ucode

Regards,
You-Sheng Yang
