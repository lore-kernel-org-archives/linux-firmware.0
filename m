Return-Path: <SRS0=KWmO=EP=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE40CD4F26
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 16:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D74E91F00A3A; Fri, 19 Jun 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781885508;
	b=pxFtvS5Y61N59L4qGsPD4JmnUeMEza3Nbuu0X1RnCVZ8ZVWY8PIHPokYXLfDoV9rw93P
	 nYNkEgbuJrBKK7KIQkaLXwVfkc7+iG7wTdCV5dQbCPJV52RA8yA/dcp/6tcja+3SQe1F3
	 EcPTnQrxywvWTJ9JYOrqFFLNOEK+go4tdZ2fDqVN0k7REBPiaXYQtMTKLLUcwylcUcIcS
	 qXJzNK/cwjmUDZFhENvnPinkjXeVhcwxaJYjKoJuaux3v3BWTuGmlipnsqUtJuAekj00z
	 GYzdVMpIN++YVrXtapf+nH4AhJCaE2SI643vp5R1+XeSutDaYCUTQFAfwY9ytsEJU7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781885508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XN5xq7bZz+FdULvBAj+iLoJCxEPksAnqQSVRLeAjsn4=;
	b=NcNiLOoHVF/rp4oOTxENdC6nQ+A0mGxdk6S4xFmkBdMHYmmz3qikhd1XAh6lVAgT35dz
	 ZOrPWzS/WC9iuTq+qoC+q/D9zf0AZHtUS6IAxdO+L4teZaDg6OFfs5seI/wLr02vZrMnN
	 rouiYD2tto6nYYsjVI+V8e3nZJ5zioGghDp0ntPHQ1+iMyabwZdWuzuMzgolP2LwSXgAf
	 /R03xLjDKXUMi+Oi4PnFQhUKtMoIMsIpuj9sZrmk4vS+KCX+JXH9wRrNToHBoSyt65xoO
	 3dk90qYkCm8FCVJjNDJdK656TmRN+sFw2JbXnoGMEPnt0gvEZpIEqNwJCRAzCIOM3Kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCDmvIH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ct1oqNaV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43EE91F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmCDmvIH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ct1oqNaV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 43EE91F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9cTm3005437
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 16:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XN5xq7bZz+FdULvBAj+iLoJC
	xEPksAnqQSVRLeAjsn4=; b=NmCDmvIHfhgoju5LGJt4Src1mbOlssMuLkr55dF8
	ULKi6YKp4DOPfbdFQ/JTwYU72Ab5J/niyZevcX4dqyyX5QhihyNHVwtD666JCq+4
	UHxv3y37t8JfhjywVuugoqTb99tLCgIiY0aGRTPfkEczjTfzj9zYQBhtaFSfSjvr
	O08zE19pJIRoNdg3jXqRk9nJnQ1/Lk/hga48gwbJEKV5Q5lZeg45MRLOYs1sjc2d
	Q2vswZk5DL3yklCHAY/Qg/MfU9Hf9Ga4X5Ue3ufR3H+xhMmJhBWZZiu4+8CzzX6k
	SVgamGaKIfdXV0XT1FyRdedVVwFj92/YMc4nzqKtE+091g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyrc8wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 16:11:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-728e3a5b3f2so946037137.1
        for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781885506; x=1782490306; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XN5xq7bZz+FdULvBAj+iLoJCxEPksAnqQSVRLeAjsn4=;
        b=ct1oqNaVY35iiV+dv9TFBPDRlqWt1E8W1X9HdOPqsEsKvPmlzRvfUEVp/g9j7jz5tG
         GO9Ia+cvWbfJS+7/r1rz0NZRQDAfmeiDz6vN9UOWue6DNZskoVDq8PtF1gE68m69I+rk
         fNzvhdq+IkeuLesTwXEsYCvPkQHxgnxico+pV/ArKu3yCMa2zreD8GTVm/G6wYDFt2fS
         znJ/hZXtEC6eBjA8IE8SQyiGJyBZX17TDhsR6cgb1MlyCmBuk5vLMOkCDQHFy7GbjTq4
         bKl2i9VJYVI2OljAGMJ6T03ExlPE5eoworMcTXCxRk8JktIqDJTZypK1aEOpHdtEhke5
         r3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781885506; x=1782490306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN5xq7bZz+FdULvBAj+iLoJCxEPksAnqQSVRLeAjsn4=;
        b=oiWHqArX1jgWdpdRA11SOclCfYcnA3oRl42O/RR7IQ5zWdy/4Yz/cggdTp2KxZms62
         NjRSY+HPHJ1rSiWnS8CLmKc/TctWuB2LkUcC9QaHoZ9cg78eCeP/YTp4MX0brUbfvfc+
         gbAAZ1pLGo0/lPBHvaIErcqsbC1ta849ompCFx2lugh06QlXaQuEM4fqKe+DlQuRMBt6
         t4OyqTqYSaBVmbDe3gRfTx7IpGfAOPFWcL/zSzSwqdqnsQOHyKUTOzqD11duH7DnMLG/
         +Oo+1z5bcfJYbuc9tUNqc5ZVNWbh0z7sXraHtto2HfQKgS6H2NwDxxCJDld5S853gG1Z
         SagQ==
X-Gm-Message-State: AOJu0YwK1IZfHHTdZaWKWrvPMesxs8a26Prbu0Lpvj/xIgXJlKGnXOPO
	ELlnRUXr+F4LCjQpV/mn5slUhTMErx4M7CckJZIBoYFtyQ2nAqAorBNqyjKtyzMh3TxX3LY1qfo
	ZoUEhlQZTIcTDioABxJhPACGeYZ4SzFjXp07VCBnsmeHjYTsKgUKbBU5JvERnPuk=
X-Gm-Gg: AfdE7cmAV7pJWHad227tQEzRHsMPkhqEi8Qwj4V1aWQLaSxRPWk8ywqLS33UAPV8D9f
	/aalWSnRSY9skr22V+29jg6AktMi8Ao3bZit5iVjA0pGwWdz6cfHD55DDg7IQghWvn6kKIBRJqE
	V1k1l+3OrxP0cfo8gUXVXduFrviRpFIjU8jSPXhEud1zipCRhWl8kBezW1Tu68UU9s2qWg6emxD
	dIuELBX0nj3PYChOQj0dKOLq3NfcLbUrj5JK0w5aWIhzF+6/su26lLXLmAXHVelyWy/Tfu+xccX
	a/qK9g3cMI8+o8F8C8ph3tTBVubfM8gb7LPmFU3BNowxN8ZKYfPR14BFGuWzuw2NafmrgatfoPC
	lVl0OmjSoYDA/uitGBoJkBu9U9+ETBpdxyxKIiCtXkUkYJBOyTSz7efo6bw3CLl6RAmq8O/UwjL
	yUxi/SpQIDsE8OezpLv5pgObtu
X-Received: by 2002:a05:6102:3911:b0:6d3:aad5:6d2d with SMTP id ada2fe7eead31-72a781494dfmr1759475137.18.1781885505977;
        Fri, 19 Jun 2026 09:11:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3911:b0:6d3:aad5:6d2d with SMTP id ada2fe7eead31-72a781494dfmr1759445137.18.1781885505536;
        Fri, 19 Jun 2026 09:11:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad574a3037sm664618e87.83.2026.06.19.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:11:44 -0700 (PDT)
Date: Fri, 19 Jun 2026 19:11:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <skatakam@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Sankar Reddy Poli <psankar@qti.qualcomm.com>
Subject: Re: qcom: Add qdsp6sw firmware for shikra platform
Message-ID: <i5hdfoxkerni33fwe5bfgpgi4h3xvgyt4vqwdntfyyomoyzc6j@qiasphycvz4r>
References: <CO1PR02MB8569B45CFD8912B922F7F833F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR02MB8569B45CFD8912B922F7F833F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a356a43 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=9LoEXHLBnMZkfbUAaeAA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: yzp4uWPlw8WRVPtG5NXQLyP1gkDCJeVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE1MyBTYWx0ZWRfXwRPM/+DZiP14
 Z6vSKWaO93MjxVFb1Fo3lGgHr/sg4uF7mqTgDyYj1WQj1L57yQ3WQz8DnGoyr34ZjInq6oclGPT
 Nnzp8CKMc/ioNr9+e5E7NjteoD7ypFR6xO4kcwrHCjCXleFTKNHxv3PVS0OT3tQnvb+0JHXMAr/
 e36vyQFu5MulAN1V2QN1ZiAFu55QLRkHtjw+3lMr7CFjpf7ZWWN1r59CGkN6wmWDzRn70eaDsbK
 QjEDAt+Fxkr/B2XOvABYVn1018ZbAJdCdJmyDUlhxD2XGuxM2oqwATKle8o5alryFTSPKiu5Vj6
 xGOp6QzjpZMcG7EprLUwQ2qpSNbD4TxzdFIpd3myDDdd5RHmncLcFieAUINxMdj6KOr7i2cl9Lt
 uIUQZTO8khQIt6Ld/9jV13gq5Ots9NxXrQDIq5zQ+QcGkvpQ4t6lU8RL6aDc0P14013awolzd6z
 MpyS+V43XQGDZRvRnuQ==
X-Proofpoint-GUID: yzp4uWPlw8WRVPtG5NXQLyP1gkDCJeVo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE1MyBTYWx0ZWRfX6PLD6H1skmKb
 Qof8Oo/mZualCtQ25vmy4JnzRGLwdK5B9TCi6IjBEgNcXWTuLmLc2C2q7W1p8LgFMK0OWsw2ClG
 oLzFM5cvSO3izKirwalXMWpLJblbDgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190153

On Fri, Jun 19, 2026 at 03:30:54PM +0000, Srikanth Katakam wrote:
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>  
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +0000)
>  
> are available in the git repository at:
>  
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git modem-fw-shikra5
>  
> for you to fetch changes up to e5851e6ff573e78d5b0a5cceeff076efca8d46a2:
>  
>   qcom: Add qdsp6sw firmware for shikra platform (2026-06-19 09:48:10 +0530)

Josh, Mario, would you have any idea why robot is not picking up this?
I'll handle it manually later today if it's not picked up automatically,
but it would be nice to understand, why it is not being handled.

> ----------------------------------------------------------------
> Srikanth Katakam (1):
>       qcom: Add qdsp6sw firmware for shikra platform
>  
> WHENCE                      |   2 ++
> qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
> 2 files changed, 2 insertions(+)
> create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn

-- 
With best wishes
Dmitry
