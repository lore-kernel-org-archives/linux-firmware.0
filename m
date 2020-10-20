Return-Path: <SRS0=VJiZ=D3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF7FC433DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2020 05:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33FA02225F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2020 05:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b2ziTygF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="g8SrnxRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33FA02225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2qZw3IrYD52hQhNpFptQcXOrcAex/dXt4OhtB4OJmuo=; b=b2ziTygFOTbDyBHhY5IcoNk/Z
	AQfYXe/DbMLjfHApnAu6ugMUO8168EPnGm3fN5r0DVmD4jCChSXiRgWdY2LHY9oKAg3/QBO+8pZHw
	faxz3yTiA+9YCbR1u5A9r7p3ubsoRmwsPib+qc7Lq8cj4EUfWqjgkKVAjwUTjL9/CfYGdn1prUIAv
	td5dDmdSxY6OWvBcH5Q0pCeoc7rV4ffDufrzW+mXzp7HDLmxdr6hpT388DLZeepHjCXSmhAimaY+W
	TiA6VHilRAYVn6p1FAPOry0sTCPvSHvv+ql+3oEmh0Y6qscNk4m0CWk0DcHtSHBfPJ7nBHhOsCBGf
	hJUjoTshQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUkV7-0000dA-Bt; Tue, 20 Oct 2020 05:48:01 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUkV3-0000bf-KU
 for linux-arm-kernel@lists.infradead.org; Tue, 20 Oct 2020 05:47:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603172877; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DlWUKsZMBs5+rfXZncpSLNI7e28fGmiAnheUVzpABSE=;
 b=g8SrnxRDs6rXzvFlb2ZUIVa7XnX98DsC653RuHbRDhi4/+JItHfyrYto9uS5iic/th7eAvPN
 CPNnFna5voEaPiqOmd2CBoMIzOBNePa3nLqcaBBn628OixqnLqrYxa1GlF8ulnHDTgrQu64J
 hiQHs95ydeSuZFmDJXzs/A2YP/8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJiYzAxZiIsICJsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f8e7a0c42f9861fb1f6fc43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 05:47:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EAC42C433FE; Tue, 20 Oct 2020 05:47:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asitshah)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4667DC433C9;
 Tue, 20 Oct 2020 05:47:55 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 20 Oct 2020 11:17:55 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@infradead.org, linux-media@vger.kernel.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Subject: Re: Update venus firmware files for v5.4
In-Reply-To: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
References: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
Message-ID: <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_014757_689573_BE3F0BC1 
X-CRM114-Status: GOOD (  16.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: dikshita@codeaurora.org, vgarodia@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201020054755.jVhB1Usv0NZI-766JD4esagnEc2oavvhpuvU9Zxu8_U@z>

Hi Team,

Gentle Reminder. Please let me know if anything is missing.

Regards,
Asit


On 2020-10-08 15:20, asitshah@codeaurora.org wrote:
> Hi Team,
> 
> Please include updated Venus Firmware bins for v5.4.
> 
> Snapshot of pull request is as below, let me know if anything is 
> missing.
> 
>>>>>>> 
> 
> The following changes since commit 
> 00a84c516078defb76fbd57543b8d5c674a9a2be:
> 
>   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/shahasit/video-linux-firmware/tree/master
> 
> for you to fetch changes up to 
> a09b728b77f5e3b335ff85c6c729248e0121f02c:
> 
>   qcom : updated venus firmware files for v5.4 (2020-10-08 15:07:59 
> +0530)
> 
> ----------------------------------------------------------------
> Asit Shah (1):
>       qcom : updated venus firmware files for v5.4
> 
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 870812 -> 873100 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn | Bin 916924 -> 919212 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  6 files changed, 0 insertions(+), 0 deletions(-)
> 
> Regards,
> Asit

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
