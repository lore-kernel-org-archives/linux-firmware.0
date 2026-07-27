Return-Path: <SRS0=kCUS=FV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E730BC531D0
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Jul 2026 14:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AED7F1F00A3A; Mon, 27 Jul 2026 14:31:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785162663;
	b=U01y5CXaRkT1vRgK244Sz5Wt67gfF5HqQ7WEBpT+QqcdyFg89Vx4IOVnrQOX2NwNN2S9
	 96aT3IFVOoLYiHT5UE2k4ZwCYc9OFC9LpIDraVbH2i5QCMl1j9Hx4fGAFVxShixLXAqUT
	 0KxiG4sU4WG9fUuvSMEVFlikc6/Qa/DH2agblbAz4LY6FuJLPl3OYs0M1KmzQGJzv4Bv4
	 ZH0fCQ3IqU+vo7HXvFGkzmze8TTyPahZpj8Q1g0VfGHmYldUog2+2mrC+gY/YHKRFlseU
	 wNcdAf2kdw7G+Y1A4XRh4QiRnt7bAj+9A9fetip5bgUxrQZSjzrNZlrNvhvbxADR4yw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785162663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vPd0GVjv2u9sRz5C1Ze2adPqEIvEZH82HnCMGArgNUk=;
	b=elKlNTMYZ1Ow0MxycW5T2QHZ0KYlqSZnZI89X8pcBp/j2BV3hxPz+7zETW7buNktDMFq
	 hNwUBoTqPrK6e85bzs8qAK0TN+LXgE/DjcqfnUz/nN6MjYzDk5z7N093hzPxW3eW0DBij
	 Rv3Mm2tU33M7u/x8OtkjcONxXWv+i5uoHg7mPG5X8F2ORyASFfFPBRGMJi/GG6BSJTpjj
	 1ejRiXTGG/bWHX9dfCh3EkPb8sLi0JcKct4NdX8TIDjsKE1IHhkLAGITg9UhL1r735x58
	 JF/c5StgWLZFviU0W5vHXGaNlqUhZqaxQ4/P1qU07DNIUPUifdNROk3kASrLmMZQQ3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LGt2vbpL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KF13ZsrD;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED71E1F000E9
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LGt2vbpL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KF13ZsrD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org ED71E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlibC4061146
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 14:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vPd0GVjv2u9sRz5C1Ze2adPq
	EIvEZH82HnCMGArgNUk=; b=LGt2vbpL8U5IOozFtsXZp8u8L6Mlb1bkL1Njno+y
	t1p/fLlwWtLD5h08JSlVCK80dGmpwoOY+t92LL+ELFML08/FiWenj7kBqxTMR8UA
	mqbSnO0mAth5ZgFm5lWJy6IRRsy+uFGECOMPbuyr52FJd2hMwqLtx25PZPcgYkO/
	QLBXRFtkNfzllWB1ef6n8x8Bf8jMPbN8Ivt5cJq8WoJ1Lp/j2S/py7mdZz1LDU38
	L+dsrq8ND38peyt/Fx5YZbFPSRVdyPDVXF0vugzcK0Gr6QNVtEiITCJRUPDBihX4
	EhLUWHmbmGDgaViua9gEtI483t7iG4bXE6NpW4h0L6XgIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq15xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 14:31:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso26190481cf.2
        for <linux-firmware@kernel.org>; Mon, 27 Jul 2026 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162661; x=1785767461; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPd0GVjv2u9sRz5C1Ze2adPqEIvEZH82HnCMGArgNUk=;
        b=KF13ZsrDgnY29SS3+pnpMoLdKX69aL9INsggteGOqGuOzNvle7w7fw5JENnVuLjGWG
         fQO3wwbYVLUWIMcHN7TVSgrULfhY5t0vcZSiiM47kv47OqW2AZywKZM06/DcL28kRsB9
         48q+BL45a598mAwbECVHLQIj7XQVI4xhmeAleX7g9xem/fersvxQV8U27tRzJrq1eEgL
         msx5J3yKZ11S77d4qKU2xw8ipGOBkYwKdYkyI/SJvC5/Uq6zfScaCfQttoo8CBS1RWq/
         Ml7JCRpo6mcYXBJmEYhdrGvBO8OP0PR/fdV927AVEZUdvkSwekkHVOYnTZRl+3I0zLoW
         LRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162661; x=1785767461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPd0GVjv2u9sRz5C1Ze2adPqEIvEZH82HnCMGArgNUk=;
        b=l60qw01nDQF/LVyzV5IV0DWQoKTsCwfou32YEIUFDP1UijjId67d+wTub3R7UvLJV7
         oJCvih+1o8xZCawRfloBBcJfPkHZSI2qc6NbAzAfpMJC33VwDyDkb014T6BXmb97YVZ4
         W4+LnPSNTslrIhv8+oF6CPTtLp7i81vNmFNONndI27ie2GO22UlY/s3tdK8S23vjIffU
         I9vkWKGZ4xG2Aj5vW+QTkjnJw1sRk8jqipBkMaZ2Uk5TDIMjGpKroBmCm8cRnRS3MYHZ
         YU9pNb6xnmAYByeNqJQSAljo1PTNqoOE02Vr7XtcPc4OTYuC3k5vWQK1qbs3xivIK4ui
         nReg==
X-Gm-Message-State: AOJu0YxPKC+1/Hmiqa561Q0jTkA0UwfzvigRUO3ByDLg+KWwoZ5YE9KI
	9JfaUxB2L+9/7F7NDNp6XjE/rRsFywsYS4b3v65dJ73yt1uPAE7idEJMcLqVvg4xAvq+Ebctg3/
	/YH4g3sHr+ErDPMOp/mKbKbe0ub1rW1GvwQz8EnTTP5CB20TJJ4pCVhg7mTwiO7U=
X-Gm-Gg: AR+sD10sr9e65EnCULxrRl67nTOpXPoGkS3k9EvnQp2ymEjpq8GRMmzkmm9aPwfpvj1
	Vh26DpbitupUBLcGfzLjkWWHrOSFzTYQVsPF61Q+i1e6e6oDwdF7TJ+Szei0j93l+hFC3Xh2T7r
	B148eOIZdJf0M39e24ob2oep8zc9G05rgdV4LVS+ZeXUzKKJhFsTl4vwnszRaFJXOdVZE43HsaX
	nxHqtyRv4E20jhnr34Zk6A2E8AiAjIjkmIURJydyE/aZHj3M28V21/CQWB9NYGDWn58Oenh7Exz
	TcXnEyvMmS1XO+PfLy+Qtfd3aBgx/bM1AaVfs37qScffUPuflhDPs1HKHkiE9bWcxhd+zKDiNZ/
	cBB8klOQjTKs4mctv/4vdgkrgOARgtwPx7wEmZxvAAFp6p42HEvXx/h5eQjyyQT10sYkulmmGwV
	co5Ko1MB9DxwYYgw==
X-Received: by 2002:a05:622a:87:b0:516:e0eb:d7d with SMTP id d75a77b69052e-529a8378a42mr93827621cf.27.1785162661178;
        Mon, 27 Jul 2026 07:31:01 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:516:e0eb:d7d with SMTP id d75a77b69052e-529a8378a42mr93823391cf.27.1785162657621;
        Mon, 27 Jul 2026 07:30:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be20526dsm1473489e87.79.2026.07.27.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:30:55 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:30:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <cx2qixfje5uyjfbkedcukuebnjewr7vkbiyh2o3awtnd4exqxm@p26wevxlhv6b>
References: <09a2e4a3-6177-4045-9214-cef696b12592@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09a2e4a3-6177-4045-9214-cef696b12592@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX0S6osBuj2ZNK
 QAciCwpZWgoI7BCN+xU8PRAhWtnmlS1sMm3afNZeztqRSAWjC3z70id54V3vXMa9q+PvgEFOklG
 27R5bMsLvdp//PZzh2zacJb3AUuxxiw=
X-Proofpoint-ORIG-GUID: oSDp_K0ShPiD34yg3TUz1fqJpoVNPSGg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX1swjw0p+ASeV
 O3YNBJXDEjNKZHSqFeeGuzZ7c9VOkWHnGD5dKgQBk5N3S8aE8rYWMimxaaqbXbCCKarTsOL6/Rf
 mDBtTNwsPhCikqxQLA7XhWtNjR8sG2/akO5XImXSoF+BaWTfiVOFGHlv9daQL5451EpQcpiGrWC
 aELoElE3r/Gqr19dcXgcz47oxvpZk7xwepae2JbKfnYpfWCEmhdBWBzUgOcVyqbnwaNyO8K/Tzx
 kj0vBr2K1spIxHhgn1XIQw64A0oRIeB4TXh4YtP/aXBBV96ElA3amFBCcDP4UWPw0P7r900Wsvp
 Xii6+YtN7M/KLzaje1P1vQT+vx+/78u7i+WWoeLeJBNTEXINHLquprQg7sEKc6385oTZlm4xO/s
 bKOOn/iSGhbtrpnHX2iXNKmemV2KWwubzyG6yTVILkkAd28ftQVSJEcC6LBqSV3rjlOk/vxb2O9
 zfD2qTdnGTrmi0xNSZw==
X-Proofpoint-GUID: oSDp_K0ShPiD34yg3TUz1fqJpoVNPSGg
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676ba5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=SPJBaMYJJlrvgNElY1oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270137

On Mon, Jul 27, 2026 at 01:15:02PM +0530, Saddam Patan wrote:
> The following changes since commit 924d73c9a2501a256d18a26cbe640548c70b3a9a:
> 
>   Merge branch 'robot/pr-0-1784191359' into 'main' (2026-07-16 10:39:46
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-monacodsp
> 
> for you to fetch changes up to b3a612782af5bea49ae6f0af6bfba6c4d7819797:
> 
>   qcom: Update DSP firmware for qcs8300 platform (2026-07-27 12:52:57 +0530)
> 

Thank, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1153

-- 
With best wishes
Dmitry
