Return-Path: <SRS0=LsjS=H5=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6817CA5FFC
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Oct 2026 11:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A6CB1F0089D; Wed,  7 Oct 2026 11:56:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791374168;
	b=EgymBtPjehK4mLiwVVdis50V1ylRsWhV/OM3T7Y7o8D2RW6KxME2A8AbiK+u/Uinmxj0
	 fwMjLJD+hzJUmolzO23LB5Zyz/XDc10FM4UOSN+ZSexbGCnB8XiHr/0cGxduhS+c3ZMnh
	 ISdbi/Iu6HXDui9aQfEvAc2RGTOat4yH0tJuiDkS7xcJ4cgxhHbZgOFaSEi7To7i/nMue
	 1iDb4pmOCYGXwuY85DBYhGQ4VRME5KgZRejgOlgYar3wQvH+2GRWKeFQUpteuYs/2dcYT
	 YM3H+YLGu0zE6p71kDc9HPPli89u0jJ9DdKmZTLgVz7Ioo8AJC6QUAhUSqjksVcZIWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791374168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qogpXyZh1NEQrmFhXv3ZRtV6zSQUhamZM3Vk01ziH4o=;
	b=sK7sIOKETewvFtKGu7uzU1IBt9YWnop96gffqhBAYM9FTHYkkzzdNsWotE1GogJu4cpa
	 1w9D9Qm0I1n3WL9wrDxuL+8KHSpBlrGT7n9PABlrEL5T+PzLM74oqMGC5VfeJBHzCmI64
	 //5Y6xcy+glIquB1N+UhSkXbk59TsseIdEbYc3zsSyelcNCzK8PgLACdURsDJ76iazUGx
	 vHIKGByELkT6yhQjbBvX+BPmw8MlbTHVYv2f/fBCutWKEcdAzQJTZM9oMKih1+f7QJ1d4
	 3Sl992eanQWkHkfjuJNPqndZRYnuL06cmLGmMEhhFYoRELUAmHg9taLjBIRrgawiPnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfSlwhk7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD8Dre+D;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7FDE1F0089C
	for <linux-firmware@kernel.org>; Wed,  7 Oct 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfSlwhk7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD8Dre+D
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D7FDE1F0089C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV78c3821185
	for <linux-firmware@kernel.org>; Wed, 7 Oct 2026 11:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qogpXyZh1NEQrmFhXv3ZRtV6
	zSQUhamZM3Vk01ziH4o=; b=MfSlwhk7VJqBCRzEHqDfemkDxchrhkhgaTqPmwsy
	0tEL6ciZhLrDIE+ttLIWwV5EbvLagFXgjX/R+GDzqlXY1PWK8soOHS1LmrT2gza1
	sVqNk0wsYFi23nl3xsWg3BKTCOM8ZUWikRoblke3IHJePUKYy8viCildWU57xJg6
	UjN5toP+wq1s/ncONp9bU0LOOyR+KnCMrU9wGi+ydNaMpULQMXtJo2sUXxh8J6l9
	gcKw9mk7Hs+7yVGtKMZiB9r5jjXMx4bNOyNjXQTT1oFxJctDZUu29zzkqryKzdpG
	pWE8S3MuBBH4rzYdHQDf7kF3RFFGmzChTxI68V9xEFIRUQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623vp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 11:56:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104eedb5b0so116048206d6.0
        for <linux-firmware@kernel.org>; Wed, 07 Oct 2026 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791374166; x=1791978966; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qogpXyZh1NEQrmFhXv3ZRtV6zSQUhamZM3Vk01ziH4o=;
        b=QD8Dre+Dea6P+Yn4JJGuB2lXNqBTH5CTWiyW8CHlxoVxqvsKbVenctBZEAVLbDSHhG
         AMSDaWFs7eZRDNCD9WzBuB9QL4RJPzz7S1VoqlsOtoDOeiGc1RbDICBYM8VA253VCNHe
         liapCvIfpifxlnh3w+ry5NB+94SuKlAmufq42K+Lo95NElHzCZxMVnfznxl43OqLBvQZ
         iuOx1Xp4U2vwGjFDen2YEST9BZ2RvolSQE/A4LIBR197IOZu2aNfYcIMsuGHj9p/pUwY
         HyPwAchjVGr3Jt02riA2IO1ElJLbNn2PgQkDlZ2RLU8c5BDsCXpsE2d/w3jajkGtPokp
         kiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374166; x=1791978966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qogpXyZh1NEQrmFhXv3ZRtV6zSQUhamZM3Vk01ziH4o=;
        b=bhKNu5G68ua+boklevbFH4/OlQADPtyOWhtkNgbKK/B+iOJ6IDTZjOOyFnQzq/4OjY
         Sa6uCVLK2520OQ030TqtGRhlCvkjnOjDlwaz4wJBckWzYYIzAA043OpfCKVXZ69TPIXf
         3I9XuS6jrZdbt1pLhS7lS+R6Lek9NfcClVNpqqodYKHSU4dzDngOxEvT7elz38hme+o+
         aFvTmtMkOSlmsY06G+o/gKxHc+Pxbic/2nLq8Avf+6qd3ZvcUbv/kajhL0f2kN0GhLB5
         TrLIeZUuxTcl7bOfUNiBRkruti7yEX0L1Y12FAxlZmAdzUI5+4+AnrgkmoiVYHc4SosB
         6fEA==
X-Gm-Message-State: AFuF++lUC1GL2PzFUtNB4IkkDj4o8Zygq4En7ycXTi1+vT567g0+3X3G
	vreog5hHeOfHkbjWvsqDU+G0tUPhIJyoUDbMC8fn0MnjC9iasZb0u/KAzZZoYoS7fkGyVRX4OWN
	K+Op4x7U05h8tu4wAK6AVvOOTgA96YXE4RyMpGyEJi93ls6Yh0CHZbXYv9yvg0KW5VhsThK+UhA
	==
X-Gm-Gg: AYBFou0bHy2MAe3gbNJTsyAgQ63OgSj8t5bg8GbgRT5hH8LcRZ8tWUci16hdf3xgBXf
	B3W10QWMROilwGD4avDvpJKLb2D1jX07RqmZ3XbvFRyYcnhsAvqe1pTnSNYQdgfmX0LqV16rfXc
	Seau2edNsqwFVufaU+CQYW3JTFdFT8r8v7zCKWLC6OReJNcDcRos9lOL8d9GGGPeNR92SvxOXmT
	h3o8LyvKGxaKWKCbaxBf0/LRS+se3/9nz7ZzQ6rQ/TGhAkcCQfPUqkiDbJilt3xOWSbzFgHzsmU
	A+PGGWEv9+cPT9KAPmFsWCd557Eg7dhGufbiqZVIFl5oK63knESj5Ae4RuQAAO0RK6wKiD3y+oE
	Lq7h5Bzuyfna8qYbkwalOYiVpOFszPijDXt3AmWVD2R3sWn+dnhMckomv8fdKqPskDVQvmK7nm7
	1XrLbTkAhrujzV
X-Received: by 2002:a05:620a:600b:b0:93c:c162:125b with SMTP id af79cd13be357-93e9b7d7036mr341839085a.39.1791374166033;
        Wed, 07 Oct 2026 04:56:06 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:93c:c162:125b with SMTP id af79cd13be357-93e9b7d7036mr341836385a.39.1791374165502;
        Wed, 07 Oct 2026 04:56:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bccfe756c7sm648328e87.14.2026.10.07.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:56:03 -0700 (PDT)
Date: Wed, 7 Oct 2026 14:56:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for glymur platform
Message-ID: <nyndlhahx4qdp6sakfsdnoc4ucgsebsu2bbclbgtc4j76gmwen@t4s6xw44qod3>
References: <b9b5e2e3-834e-4f0d-b1f4-19a3bd024820@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9b5e2e3-834e-4f0d-b1f4-19a3bd024820@oss.qualcomm.com>
X-Proofpoint-GUID: c2IL7o8uMZDkyObRcv59ooAWfVZVHkvn
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac63357 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=ufVuahYbHPQcr68mHukA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX44/Y6FJeS8F5
 PQk8TuydoGShS3UrWsKamTX5Lh5dE/mNLxvreCfPhyZEixHyIerVNyfjhFeF8t9prdmhS4Y7ebg
 q2DoY1A0mybcSqfbgfBTOo//bVcbeN8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NyBTYWx0ZWRfX/RtaFxpI6eV7
 t5jz4kIEtgx5fMQjqiXcT14zSfBc/Pe0LVCK0jYzJu09AUAWgsdiqBE9wW8PMcH2xDfPeU/frpC
 XJPHQfDGKqxeIaFX4AtxMGH689DM0wv02BxkNReYF8AJ93vrn7guZ626obLJKgl9yb5HXOp4QnL
 HMMPu0xRDDraN1BU3VGnbvm5/Gr2Ip0NR4REq3pyWgyqnt8Hc9naVCKFEXn6qhtov4Pby0ExbZB
 HFPotwfbfqyOgfRvY9yodenfYooOK+RZhmXRubngRn4IdzI5XBQSEXAsoEKB/AMVjygGeesF1c6
 c+tpOsV2dBoq+GTIXU2Pc3mz2vTWU6dS9U/G2cCbLCQzwd4/j1EgHWT2VO5sQopvKrqfErLWwg0
 4K1kP2AZKzjLqNdOzeqc6zSafLntdax28N/S0OUTaHoxOVdq4bxvRx5F7hJizilSFcJyWEH+Xmm
 sjFkzUn6g4TCB2KIKIw==
X-Proofpoint-ORIG-GUID: c2IL7o8uMZDkyObRcv59ooAWfVZVHkvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070047

On Wed, Oct 07, 2026 at 12:40:07PM +0530, Saddam Patan wrote:
> The following changes since commit 79104f902411a949afe1da25dc25e05e3160fab0:
> 
>   Merge branch 'robot/pr-0-1791302343' into 'main' (2026-10-06 16:25:17
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-glymur64dsp
> 
> for you to fetch changes up to 6b5ab2d6f06018479dcb6701980eb508714896c8:
> 
>   qcom: update ADSP firmware for glymur platform (2026-10-07 12:33:32 +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1293

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for glymur platform
> 
>  WHENCE                   |   2 +-
>  qcom/glymur/adsp.mbn     | Bin 17070040 -> 17053656 bytes
>  qcom/glymur/adsp_dtb.mbn | Bin 225080 -> 225080 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
