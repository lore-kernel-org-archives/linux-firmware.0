Return-Path: <SRS0=oqNE=FO=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E7AC44515
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jul 2026 10:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C97EF1F00A3A; Mon, 20 Jul 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784543425;
	b=HhsTeVQsZq5bRy5B1YrNVx1u4VU29afa7qfLbDDVWP2cRCEfAzzEoXa/7vzypJ55I/Fr
	 GQRR06JGP5VtVm7jcKSf0KUTIilbDIU3A4krLFkqlgFMhG1sUPJ9dK5RiccXjq0BKttLW
	 pTxVQUOmIbkm7iWnN96nBA41gaE+TyeBe/8rDofzncxasVi5p3qBEFWDIyKDk+WhT7LWh
	 WDgI6qB8/rmZi/lsJkw3ii0JnEBo2BIq/KJwVP5pE2TVznB8tBAyuAF1cxIeO8byKLhRJ
	 BnQvc5HyJwaAb1VwEHCeNNcOKTUVU3fdqGLyrfTtNkOanUHxSQh3RU+Cy/vHuUz/zRg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784543425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XmGzYPDmnD4gHqgGYkf7Q72dvdEb5ukPjOM5EimBZqw=;
	b=ypI7Mq8sekiSMrTPE6+xPR7iozdhEWDVNEGWo4l/PuTuensF5A8gHtnyQG3lTrkbekXN
	 vtL7CNT8HNulCWK53Ryd8KT8VEXJlgzjzYcgTQ8ig9yrmyInv4i8R04A77f7jj9VwMlH0
	 OwKiz7iY328EUUczcQE34FkmIUSSb401tmesTRxsKQduhfdnMp7tS+ex123yk/b6OvAqc
	 6cDcRz3528at+7SL1MlnKI+uQUtZmWxsJmOOiYhn4+mvFZgbAkT9MT8SwTDoNe6Vjw+fm
	 u7ktHWAYFS5mqzCaKg1PcWiZv3fUSe5+N47LsAIhqmnkz8S+DxfF5pTYFd4i2XMxIHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+A0K4rP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iiNJQm+i;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1960F1F000E9
	for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+A0K4rP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iiNJQm+i
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1960F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vjr42320979
	for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 10:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XmGzYPDmnD4gHqgGYkf7Q72dvdEb5ukPjOM5EimBZqw=; b=f+A0K4rPiiTvrgno
	UhhLxO4SbvWqB0t503p5miRdDNn7eTxpdNPJp8y6qmPuenqWAzquQR0DaesiKUCk
	CTbymZdT/yhzxI8SWuvitvkcxurPWoakKhWvpFMbwWCW8gK8WooEGNzioh4UpuWU
	4of8VmZCv3oyku+xb5mXiDAGpbUuYzSyI1vA9HbUg9zQMedTZSNL8MG0l3D/p0tz
	X8RaAhumq5+ewems00siMB+eeADcWQgxj0M8AxlvMaabr8OzvRBos9+VzG4yl8gP
	yfaKSGvhPMiYjPJkCGcBJoGMdRxDBnFS/TmNLWL6np5KIGx5/6y2sn2C8ZB93/JP
	XB446g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0krw1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 10:30:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c075c1e25so139464271cf.3
        for <linux-firmware@kernel.org>; Mon, 20 Jul 2026 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784543423; x=1785148223; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmGzYPDmnD4gHqgGYkf7Q72dvdEb5ukPjOM5EimBZqw=;
        b=iiNJQm+iWjf6Ppn5WsafGTgPr1XAQ5PcbSvO02Zuj7CEOBGOipTKb0qhXz7Ex8CqXc
         x65uRJo28dmr7UWiIcZf6VGLJhgCcbwUqWxclNBGEoYma+//D/QnmXYbFYO7UyARtAC3
         4Fcw+M6ADiaegIw3UCqXWjl/uYjHOHhrh66u/tXhj2ZdbTGmX9XMFg7fGBi1Oa8YE+kH
         IISGAxFRW8FdOtzQ7xGkFDkVG9YZk8IZ6YLInGT1FGeZCSwoyAVT/Eei7HD5DNeOvQNw
         LnzrnAh4s6kgcslsIilbKvzQvavZ6bXHYFO568HWoNEu3uFLjPLC6XIJ/fWKHJeCqF6Y
         SGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543423; x=1785148223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XmGzYPDmnD4gHqgGYkf7Q72dvdEb5ukPjOM5EimBZqw=;
        b=T360eVhZs78f3XyU3owAKICUlq6Jz1dxlxLlUXYsFuzJQczz4k5YuzlWDip4hEX1E6
         eZcVnhAP66I+Cd+oNG2gc0chRhyoN2q9g2yfULWud/D29hpQWVYKzCyFxj5fucEsiNhJ
         cFyYu3+hybK6iuTdsR9kfniugqrgIUplDY5ureAE7Q557dbJqNl66tAHmq53a09AsgUy
         2MPtlfdzloXFXElcZCLawooNrI7xfWq3YXip0tfp35Wf+rolPX1jtPOr1rK4Ej+5KIKw
         eKzibYjg0VKQjDtdyIzz6dkQdw00To9z6saDVz3YO42kZZ40ALbHrQEWJUIVHvXHnvqM
         HQkA==
X-Gm-Message-State: AOJu0Yy3+Hw6kqB/Yqs6BXWQunJZAbloBQSXZVZm9ARiOzIddhs3Jjcl
	/FYpKGt++tllLY+uA1OdVw5AjUnVSQ2phKKcIEfeKSEq49UDJbjecwYCi522LPgqLrQkBQfkCH5
	mzvMfbXVGm+FLtQ9qvPMEa73qDxbQO0PuzaoavZiEKGcZKwZ0EOV8G+SImH9enoQ=
X-Gm-Gg: AfdE7cktzubjmX1Bb1W/pV+6l4UkBEXDJwK1Ews21EWAwBqB1Olwq+0LYJx3vPaRGUy
	4bfSNVAhbCQWef5U5bbgPnIcKgz82w5P/lrB/2jDT27dQQQSolOZirJcJjLv7Xlw9Uk0N2FN5Ld
	GhYjGSd6Sk2p0FPUg/26N9OrFK/OEBiBET60BsRyJfA4vB0SyZTzH4GFN+DbvrrHR7C7LM76PRK
	mBOeJB/mBdql16eZ+EnMftMTfEEOcDl9UZycLmzRCNc33slFAZwo+ydhkZrTZEiSfIDSxwknD3V
	coR9gPh4HytGa6MLolE0GhM3GyRkZR2++eW5zPHGMHTl44zdc/KV/vz+DnO3LKdeugeSTKqHJ0j
	/l/WH69+Y8ZfxRcoL0GnbctdJ+QPBh6tGDOT2kUgckBjWIamiIbgl3tTA/a5mdZ3P9RILuVBN0j
	K8jpMu8Tw1I1RkIw==
X-Received: by 2002:a05:622a:3ce:b0:51c:43d8:860b with SMTP id d75a77b69052e-5213e28f1aamr119571011cf.54.1784543423407;
        Mon, 20 Jul 2026 03:30:23 -0700 (PDT)
X-Received: by 2002:a05:622a:3ce:b0:51c:43d8:860b with SMTP id d75a77b69052e-5213e28f1aamr119570471cf.54.1784543422833;
        Mon, 20 Jul 2026 03:30:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a24737cdsm18923e87.77.2026.07.20.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:30:21 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:30:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for hawi platform
Message-ID: <3tytlfz246hpwbfdxa4zyej3hakitfxpxbv26xcrwbjjv6oxwq@6dcrn3sgxigq>
References: <7cb3f791-1a97-4698-ac7a-7f4e2fbbb826@oss.qualcomm.com>
 <d9cd9e05-ee53-44c0-b787-0fbb97bc1e9b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9cd9e05-ee53-44c0-b787-0fbb97bc1e9b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: cco6__zEtbsB7w6nb0nDuJXFGEk1mMuK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNiBTYWx0ZWRfX2LkvNr40RJsa
 lBlovZsnh2pbhrafkEGCeZfQCzN0UV0KLraxacQ0mwYj5a4e+Iek+i41T5ygFLluABSNf5inQI5
 5akb3dD29ItXx+j72P94U+8Qz2V53xY=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5df8bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=YIo9rLl6IdXWDbH72JEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNiBTYWx0ZWRfX+ZXTIUC1sx+0
 pE1SR9i0fEbM4xxJmk6bn+gI/yDN7Zl/+/RC3zY+CFuQwEGH3VwVSOJn4lfxEQ17d3yImyP3Hqu
 D2Oei/GiNKY4JgU1P1kNorQFWqaBt0dDnI4T/hSnSJcYk9EFUc08DdBWJnpNR3NL/wk25pjnyQ/
 0bBAokDGTSQA5uHCFNor5kwlPMLVfBmWsYWWIbAdtgQD+RBzrCohu28mGygdwtaZIaPolVWNqqU
 nDzKOOCWVzScX0/fUc0/+GmfV+k4vP45/2frT0O4I3lRN9wcX7jfyyBJna/fhnx4d+HqKPj1tc/
 2Cjlu0I9RReI/T/BKJtOdgltUFg1rm+DqtEYenNrWfSQboTazszmIPvMXBg015hWXKzbzFxfO7D
 SLSbrsefd9rKn6lgiZtaEcVvA/kC0jEPFGNEPYGQQRvAzfPikPMpKT7xh8iF0G29rF/rYFtvZA2
 UFjEnyatxFJRu5gN4iw==
X-Proofpoint-GUID: cco6__zEtbsB7w6nb0nDuJXFGEk1mMuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200116

On Thu, Jul 16, 2026 at 07:21:36PM +0530, Venkata Kota wrote:
> 
> 
> On 7/16/2026 2:09 PM, Venkata Kota wrote:
> > The following changes since commit
> > 85336dd8506867f700b52ba8ae98b84c809eb351:
> > 
> >    Merge branch 'powervr-2026-07-13' into 'main' (2026-07-15 13:19:44
> > +0000)
> > 
> > are available in the Git repository at:
> > 
> >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dspfw-
> > qli-hawi
> > 
> > for you to fetch changes up to 9bc90ae3a3f0cd75bfa6dff97bc17ef1463fbf61:
> > 
> >    qcom: add ADSP firmware for hawi platform (2026-07-16 14:04:32 +0530)
> > 
> > ----------------------------------------------------------------
> > Venkata Kota (1):
> >        qcom: add ADSP firmware for hawi platform
> > 
> >   WHENCE                 |   7 +++++++
> >   qcom/hawi/adsp.mbn     | Bin 0 -> 17086728 bytes
> >   qcom/hawi/adsp_dtb.mbn | Bin 0 -> 180040 bytes
> >   qcom/hawi/adspr.jsn    |  22 ++++++++++++++++++++++
> >   qcom/hawi/adsps.jsn    |  22 ++++++++++++++++++++++
> >   qcom/hawi/adspua.jsn   |  29 +++++++++++++++++++++++++++++
> >   qcom/hawi/adspuo.jsn   |  22 ++++++++++++++++++++++
> >   7 files changed, 102 insertions(+)
> >   create mode 100644 qcom/hawi/adsp.mbn
> >   create mode 100644 qcom/hawi/adsp_dtb.mbn
> >   create mode 100644 qcom/hawi/adspr.jsn
> >   create mode 100644 qcom/hawi/adsps.jsn
> >   create mode 100644 qcom/hawi/adspua.jsn
> >   create mode 100644 qcom/hawi/adspuo.jsn
> -- Please do not merge these changes. There is some discussion pending on
> this.

Sorry, this was merged way before this email. Not to mention that "some
discussion" doesn't tell us anything.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1140

-- 
With best wishes
Dmitry
