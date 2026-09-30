Return-Path: <SRS0=wsd9=HW=squebb.ca=mpearson-lenovo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB96FCA5FC1
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Sep 2026 20:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8416A1F00898; Wed, 30 Sep 2026 20:15:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790799314;
	b=gVaBgbkxnyJCcmEsbTZQyhXn5zgPD588Zije9nZI6D9Chdi4scLZsIYBDxMA7waW8yO4
	 1NXVX0719X898n+HtLRm8vlETrwmSBGopcmr35o6ZOBTZWgBcC3ZlSj1rcUiZ9Qha61yq
	 IWoiQiLueEO3NBZPuT8ywGztdqKJxaq6M7/RhwW/KWMMN3yrBdMmrNl5DSRu7uZb505qR
	 ZkHC9xQnkqxLhAyVmFYFJzTHL80izfqiFCfJBrOgJyyq5Piq6Ka4yT9qamPh793U8n5Oo
	 +3gKhMCBye1aYKYuk3bSTnZ/mM1MUkUAcWUAK3pzjuroEma9A+0pW/7UKqKiecEepAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790799314;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:List-Id:To:Cc:Message-Id:
	 In-Reply-To:References:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=jQTnSgDK99jCKiZUratD1bk1l5wW+5A20QmQGyivJH4=;
	b=vW2Y2VnmfFZzcWVbbyQgjMoVHemgwzHkvq/wegYhYLVcAJqkdRGXLxh2MYp6p6GuGfGq
	 ZsWhqYvzRqQcZ2/lh3Wc7zucK1JtPVyaDO8jGFG0SbuzlTeU0IuDvDb2u4LlPye5BjcQ1
	 Xqv4raneuAmcwNIPvORvwMxdahk38Vq2XbOZH+VTf31XmLQmhO/r3xRCi8ZUTmAXNyicD
	 1qS9LXCaXfR+P6T2cpXxd1tgt3v25ps++TJR5lIiRJlWyVg1aIBgsco2K33Kz+65NUGOF
	 WE9YdOjK/y82oDp0ixJ7u4ecigVOAPtuoDn/amVQOGX/+UgfyC3eHREtNrwEjWKTsbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm2 header.b=dIBfm09G;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YABmpDLH;
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AFC81F000FF
	for <linux-firmware@kernel.org>; Wed, 30 Sep 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm2 header.b=dIBfm09G;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YABmpDLH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5AFC81F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 49D0AEC023F;
	Wed, 30 Sep 2026 16:15:12 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 30 Sep 2026 16:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790799312;
	 x=1790885712; bh=jQTnSgDK99jCKiZUratD1bk1l5wW+5A20QmQGyivJH4=; b=
	dIBfm09GPyrrHS45P/7BSo9vxgK5tmFvxUWMgVgcwyjCq2HAYIdwyMZB+icnHA02
	W6ZiPH2ZDMvO8e1+yKoWVCIfQQXg38faFGfHyZ6eRlNAJD6uRjh/mJvfRmwub9JE
	ZuyrsqaWVL43gcRaQPY+Zf8lvEJM0F4GIjmsajMpw/r+23iJBzWV1ZTTjBonx1bS
	p/rzH7TEqb50hEEVzPInFnbYs/6ILmrcG5j9wYxbO+/Ju6F6hNXH46NikXmJOwR/
	pJUQvoVLLmpdanGJW3riQTZfMjdivPMpmcWi/OmkQLHIriiCoN/JWxJBbc/mq+A2
	lhO6UDwIyyhUFEawu3TrEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790799312; x=
	1790885712; bh=jQTnSgDK99jCKiZUratD1bk1l5wW+5A20QmQGyivJH4=; b=Y
	ABmpDLHxSWZLopjRJP0nXIFPwriL+cFkF9qyrBKkoBWCJ3NUQ6GAlwTelD8OGbGJ
	wglUX4p7c4zvg8Lpz+xg+cTe7GONhHPb5frignEDXIH7U2Bdeq+9a+fgw52uOS3L
	JWlGbbJAFpHMXqmCvvwWB2hY6IRkwFxGp9nLEQEshbO7svuRI4QiHfvl9q9sbByo
	t/DJJ30S4SpKvTRucZGEEB1K6alZgYFZVwUuuk5XlKDORzoaNZXZw31jARUrIwwV
	qn7jsiw4P+jePvr76Bg9XA8mepyoKiWQnKhZRtHyLTaHAzN0WW/q0ZTznOm9HPe+
	2VCnwZJsGjwVUzk2I4aTg==
X-ME-Sender: <xms:z229arOkkIXHNEBHhUtNyNSWUMvobyz9MT_wdgCyV-mlDCBQz3cLNQ>
    <xme:z229agzGIb1h50kPRaMDfJtKVg0b-cEMtgmHRndrYtFS99f1lxSSzJ3LoxULoBDUR
    GTwxWeFuqRGhq_IpHw_qHxJhy7CVvIHy6Msssp8a8v8M1cP483LcD-b>
X-ME-Proxy-Cause: dmFkZTGy2uJ/1ZgN2jCVkACy95SlJ6KQBUKw6DwrBhFqnzCxyKv3cXoenaVwV2fHTm8Osd
    7REffm7B4kapnYZNBRDx2tRzvNr1nx1gPrSsK8jkm4EMKvxylbXS3a7UYecp9IwWK1Fxca
    G05+b52FEBvUdIkIOv05CBSX/dZjfapPIjcC2gSD67SykrrR5hJggjmxpWZ1GxQZoufSl1
    i3omshVhlqCU7aD9f28jwaQ2C683bipwOu9wqWgSJt6MlfZUJnDJ8FTWNb9gBO6CGihfOX
    lXLNW2EBvpgUqPxw4VW+vMAsSpTm/6BaAXshDYbtaRCtDKf7j/XHHp6NUKYb+B7XEkWyXv
    Lf0Qc+AJ0jhOsTOSEyDBDgm5Z9+/VGBCJ+Xe4w8ht7DgAjdA2L0ZwmbB3z9ESY5lrQJRz9
    19M28mcYvojpMRm1/DpRvdXb10DgYH4RlBtlZyJz96Ykg6ds9l/wHMDIEN9rNEp2Ney+qo
    wssK7LDfGr1QrBuir4w4sW8r8lTUp6Ck8lETv7V3lDq/5LYMTau2ssbsPPsMDVMKl+PRfQ
    2GBIpcf+sB8Z4nYbaNPfI1KrOrblW4wsy+p9KtkMC/ODUGUOu/AIPchrBIHqnYuKjUTEYZ
    VIk4hYdBuuwgXRC7/gD3A5KQc6RGL8kqE7UglgdpcuTV8HBPsYggpbpgizJw
X-ME-Proxy: <xmx:z229as4UwFHFvYOKc0V3MEE1pqVnXL9a3sa_y1gN3c27CsVF7GhsFw>
    <xmx:z229akzWjk6STZZiRkMGabcT7NuXGYveABERsjNeUgf1cVrorHw1xg>
    <xmx:z229ajwZfODsZpQKQDDz75oUyTnJd2J5RrH_2WbwU9fV6OMt_rKwsw>
    <xmx:z229aszQc-S_gn-Aa6X8GV9gu8gXohEYn7p36ZZgIG_ba5I9zNGOMQ>
    <xmx:0G29avJ_6KYagWpQnJpwrHDTzvx96R7ekHKyKpmHpdmkTzSUCJthjXxj>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 7BF4C2C0006F; Wed, 30 Sep 2026 16:15:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AnJuYCNk0mZc
Date: Wed, 30 Sep 2026 16:14:51 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
List-Id: <linux-firmware.lore.kernel.org>
To: sunweiwen@awinic.com, linux-firmware@kernel.org
Cc: zhangjianming@awinic.com,
 =?UTF-8?Q?=27=E6=98=93=E6=9C=AC=27?= <yijiangtao@awinic.com>,
 "Marco Giunta" <marco_giunta@outlook.it>
Message-Id: <4b70e056-89d9-4d92-8ecb-ecb4c7d48c8a@app.fastmail.com>
In-Reply-To: <000001dd5085$3216f260$9644d720$@awinic.com>
References: <000001dd5085$3216f260$9644d720$@awinic.com>
Subject: Re: [PATCH] linux-firmware: Add firmware for awinic AW88399 SmartK AMP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 30, 2026, at 1:39 AM, sunweiwen@awinic.com wrote:
> Hi all,
>
> 
>
> This patch adds firmware files for the awinic AW88399 SmartK AMP driver,
>
> which is used on supported Lenovo devices.
>
> 
>
> The AW88399 is a smart audio amplifier that requires acoustic firmware (ACF)
> for each supported device. This submission includes 8 ACF files
> corresponding to different Lenovo project IDs.
>
> 
>
> Note: These 8 firmware files contain identical data but are named per Lenovo
> project ID for driver compatibility.
>
> 
>
> File: awinic/aw88399_acf_17aa3906.bin
>
> File: awinic/aw88399_acf_17aa3907.bin
>
> File: awinic/aw88399_acf_17aa3927.bin
>
> File: awinic/aw88399_acf_17aa3928.bin
>
> File: awinic/aw88399_acf_17aa3936.bin
>
> File: awinic/aw88399_acf_17aa3937.bin
>
> File: awinic/aw88399_acf_17aa3938.bin
>
> File: awinic/aw88399_acf_17aa3939.bin
>
> 
>
> Version: 1.0
>
> 
>
> License: Redistributable. See LICENSE.awinic for details.
>
> 
>
> Please review and apply. Thanks!
>
> 
>
> Signed-off-by: sunweiwen <sunweiwen@awinic.com>

Just a note that I've discussed this contribution with Wayne. The Lenovo Legion team agreed to this upload.

Acked-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark (Lenovo)
