Return-Path: <SRS0=I8vo=OH=gmail.com=vicamo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72577C433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Sep 2021 03:05:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5BAD6611C8; Fri, 17 Sep 2021 03:05:36 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1711F61019;
	Fri, 17 Sep 2021 03:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1711F61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id w19so7741555pfn.12;
        Thu, 16 Sep 2021 20:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RTIBZcrHfgJRG/qPnwrsIiHxUCIqeKEyFFMD3ajkpps=;
        b=MjTxzhKx2i4cZKH349iVw96UtjrksO6cNpv0QjPvTiDd+oOMX9ZvwflK5iX3hj2k+w
         CRlh4jvo8KR2r/wa+FkSA/41WwCjkwMXNxuqcqCOPlxl37UkB8ZUC2w9NaGnFDWbpTaQ
         RzH7WbXGollrmexBMmii66zz0LWKUM34VHqIL5FjxWLzb8WS3d/F1yC0QHTDrrwBdxxr
         2VI3J+yQvCvFq+tnQrlZxgn16HWjEksHVgni/VAwU7pd2Mj1ouiIwbCeuXuwOb8EKTTg
         GSheuJ9U13nuHoY5gDnp8ilgL2VzC1vO5Ttp34UuYMwcXNjZbsVOIBq+ohQxbyyDlUiB
         EmCw==
X-Gm-Message-State: AOAM530ubh4cEYJxuTxPhaW2Melue9qGKpWuat5niMRjduWFGG+lecl3
	zvsbk3rFAwGDfqCtwD08Zwg=
X-Google-Smtp-Source: ABdhPJzjx4ozIroyvDi280lCL65EEhatbzzs93E8RHqCIyeireUVIDeOWH/DhZmC4d0dwEmU1LpfSw==
X-Received: by 2002:a63:5f08:: with SMTP id t8mr7883774pgb.353.1631847935461;
        Thu, 16 Sep 2021 20:05:35 -0700 (PDT)
Received: from [192.168.0.242] (218-173-145-126.dynamic-ip.hinet.net. [218.173.145.126])
        by smtp.gmail.com with ESMTPSA id q1sm4104993pfj.132.2021.09.16.20.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 20:05:35 -0700 (PDT)
Subject: Re: pull request: iwlwifi firmware updates 2021-09-14 v2
List-Id: <linux-firmware.lore.kernel.org>
To: Luca Coelho <luca@coelho.fi>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kyle@infradead.org" <kyle@infradead.org>,
 "jwboyer@kernel.org" <jwboyer@kernel.org>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
References: <8ddba225f68405b5d4ed8b6cd9dcd05a03f532e4.camel@coelho.fi>
From: You-Sheng Yang <vicamo.yang@canonical.com>
Message-ID: <576a9cff-b1aa-a46e-9e1a-bf99f46ddd8d@canonical.com>
Date: Fri, 17 Sep 2021 11:05:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8ddba225f68405b5d4ed8b6cd9dcd05a03f532e4.camel@coelho.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Verified. Works for us. Thank you.

On 9/16/21 8:25 PM, Luca Coelho wrote:
> Hi,
> 
> I had typos in the WHENCE file in my previous pull request.  I have
> fixed that and here's v2.
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
> The following changes since commit 198ac651f46b7d4efd660a1f5ab4f93ca422947d:
> 
>   amdgpu: add initial firmware for Yellow Carp (2021-09-15 09:03:35 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2021-09-14-v2
> 
> for you to fetch changes up to 0324161cb0723fccf5d7659114851cf8c1b1cda6:
> 
>   iwlwifi: add FWs for new So device types with multiple RF modules (2021-09-16 15:19:45 +0300)
> 
> ----------------------------------------------------------------
> Add iwlwifi firmware binaries for So with Gf, Hr and Jf.
> 
> ----------------------------------------------------------------
> Luca Coelho (1):
>       iwlwifi: add FWs for new So device types with multiple RF modules
> 
>  WHENCE                       |  11 +++++++++++
>  iwlwifi-so-a0-gf-a0-64.ucode | Bin 0 -> 1515812 bytes
>  iwlwifi-so-a0-gf-a0.pnvm     | Bin 0 -> 41804 bytes
>  iwlwifi-so-a0-hr-b0-64.ucode | Bin 0 -> 1427384 bytes
>  iwlwifi-so-a0-jf-b0-64.ucode | Bin 0 -> 1365628 bytes
>  5 files changed, 11 insertions(+)
>  create mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0.pnvm
>  create mode 100644 iwlwifi-so-a0-hr-b0-64.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-64.ucode
> 
