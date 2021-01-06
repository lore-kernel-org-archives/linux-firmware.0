Return-Path: <SRS0=U6fd=GJ=infineon.com=chi-hsien.lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431A7C43381
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Jan 2021 03:51:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A9C522D04; Wed,  6 Jan 2021 03:51:06 +0000 (UTC)
X-Greylist: delayed 62 seconds by postgrey-1.34 at mail.kernel.org; Wed, 06 Jan 2021 03:51:05 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4939222CB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infineon.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=chi-hsien.lin@infineon.com
Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4939222CB1;
	Wed,  6 Jan 2021 03:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1609905066; x=1641441066;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=JAXmUqG9WCuB3G5ul5jv3VwjVDOxHDBicn7cX29ASTk=;
  b=W+Tx8KqqOUqJcmVHTNVUIGsSkyDCUOLB9Vzx2xlRvU9mE8tbi6UsP1NC
   R0q2f1XSLi7+vHeE8ebn+lR+US57Yf8WyNdY4jxBbhcAXKBzoEoLZp1mr
   cmLPipOqjE8YF5ObYKnWZXP0kbU4sdD03uLHSfODZurKkA4CGuzEYrzjT
   w=;
IronPort-SDR: uahLTDCZcsXB4E2LHHJb1k6hvFlOU8fSy9juRI+DWDyCZe0SbDVLDUQmPMRhtbSynZY6iCACDd
 e5PV07Kf8wB5yijyIEq3BcUIe2Scmef1q7KDaWur0yuprmv8Ow/+zhY1tPcFo/wDqZoZ0bl+WC
 zN1trlfNENauEzL3sChDhaMJr27GWCY9h4Y689sLLwaJEwO+MzdVKuu2avW29OFGxbJf1Tvncn
 gsAnFiAOEcTJ3hfNDCXlEdbo7HzsFE3jg1OXBghGVXlOsJKfQZqwrj1F5QwenCB/+xguTVpj+E
 peY=
X-SBRS: None
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="207146886"
X-IronPort-AV: E=Sophos;i="5.78,479,1599516000"; 
   d="scan'208";a="207146886"
Received: from unknown (HELO mucxv002.muc.infineon.com) ([172.23.11.17])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2021 04:50:02 +0100
Received: from MUCSE707.infineon.com (MUCSE707.infineon.com [172.23.7.81])
	by mucxv002.muc.infineon.com (Postfix) with ESMTPS;
	Wed,  6 Jan 2021 04:50:01 +0100 (CET)
Received: from MUCSE709.infineon.com (172.23.7.75) by MUCSE707.infineon.com
 (172.23.7.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1913.5; Wed, 6 Jan
 2021 04:50:00 +0100
Received: from [10.9.112.61] (10.9.112.61) by MUCSE709.infineon.com
 (172.23.7.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1913.5; Wed, 6 Jan
 2021 04:49:58 +0100
Subject: Re: [PATCH 2/2] cyprus: Link the new cyprus firmware to the old brcm
 files
List-Id: <linux-firmware.lore.kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>, <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, Hans de Goede <hdegoede@redhat.com>, "Arend van
 Spriel" <arend.vanspriel@broadcom.com>, <SHA-cyfmac-dev-list@infineon.com>,
	<brcm80211-dev-list.pdl@broadcom.com>
References: <20210105160443.156995-1-pbrobinson@gmail.com>
From: Chi-Hsien Lin <Chi-Hsien.Lin@infineon.com>
Message-ID: <1fe934f8-9cd3-7c95-3e8e-19639d7d9b2a@infineon.com>
Date: Wed, 6 Jan 2021 11:49:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105160443.156995-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.9.112.61]
X-ClientProxiedBy: KLUSE718.infineon.com (172.28.156.156) To
 MUCSE709.infineon.com (172.23.7.75)


Peter Robinson 於 2021/1/6 上午 12:04 寫道:
> By linking the new firmware to the old file it allows exisiting
> kernels to make use of the new firmware and make use of the
> newer firmware with all the associated fixes.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>

(+Arend and lists)

Hi Peter,

The folder name is Cypress instead of cyprus. Could you please fix this 
in v2 commit messages?


Regards,

Chi-hsien Lin


> ---
>   WHENCE | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index 1bd5085..354d52a 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2651,26 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
>   
>   File: brcm/brcmfmac4373.bin
>   File: cypress/cyfmac43012-sdio.bin
> +Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
>   File: cypress/cyfmac43012-sdio.clm_blob
> +Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.clm_blob
>   File: cypress/cyfmac43340-sdio.bin
> +Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
>   File: cypress/cyfmac43362-sdio.bin
> +Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
>   File: cypress/cyfmac4339-sdio.bin
> +Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
>   File: cypress/cyfmac43430-sdio.bin
> +Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
>   File: cypress/cyfmac43430-sdio.clm_blob
> +Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.clm_blob
>   File: cypress/cyfmac43455-sdio.bin
> +Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
>   File: cypress/cyfmac43455-sdio.clm_blob
> +Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.clm_blob
>   File: cypress/cyfmac4354-sdio.bin
> +Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
>   File: cypress/cyfmac4354-sdio.clm_blob
> +Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.clm_blob
>   File: cypress/cyfmac4356-pcie.bin
> +Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
>   File: cypress/cyfmac4356-pcie.clm_blob
> +Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.clm_blob
>   File: cypress/cyfmac4356-sdio.bin
> +Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
>   File: cypress/cyfmac4356-sdio.clm_blob
> +Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.clm_blob
>   File: cypress/cyfmac43570-pcie.bin
> +Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
>   File: cypress/cyfmac43570-pcie.clm_blob
> +Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.clm_blob
>   File: cypress/cyfmac4373-sdio.bin
> +Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
>   File: cypress/cyfmac4373-sdio.clm_blob
> +Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.clm_blob
>   File: cypress/cyfmac54591-pcie.bin
> +Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
>   File: cypress/cyfmac54591-pcie.clm_blob
> +Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.clm_blob
>   
>   Licence: Redistributable. See LICENCE.cypress for details.
>   
