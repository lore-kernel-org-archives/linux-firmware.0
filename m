Return-Path: <SRS0=1mtE=4N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5691FCAC5B0
	for <linux-firmware@archiver.kernel.org>; Sat,  4 Oct 2025 08:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23807C4CEFA; Sat,  4 Oct 2025 08:34:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CDC1C4CEF1
	for <linux-firmware@kernel.org>; Sat,  4 Oct 2025 08:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CDC1C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5948R5Sn021020
	for <linux-firmware@kernel.org>; Sat, 4 Oct 2025 08:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QWqIxbYXuz7DX1122KQxlJaU
	KvX4B1yApqS9fxQNuuI=; b=oAokR8Bzd56hZgp1EFmQNMhsVgqVnVVx+KU4nyXa
	jAaSEKWhnamk9MYj0eeIAy5W2/ekZqeFuL/1DerMm47nhaIlZCqp8D/cK80mu2Kl
	AkbmJ6vV3OnjTXuoAh3Isxqr6130Bsetr2yNwMMOvtGKr8V/WABfI+DKQkfCpFmf
	E4SmiEUtRmhAKonfKZBuqh3DbfC2upUUGMbhpL9vpH4Dx7NHeew5lXVlkEgrk+nX
	6syPFq2gFlIGemp6fT1XSH9XYd4I/TIcJtmfbEfIUjH2diu34bhmTozixNWTOLjs
	gTGibGdjJXNNLHOTa70GBc+/Ar+dLC16n76fzo94x74Wng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhg7t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 04 Oct 2025 08:34:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d602229d20so57633151cf.3
        for <linux-firmware@kernel.org>; Sat, 04 Oct 2025 01:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759566884; x=1760171684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWqIxbYXuz7DX1122KQxlJaUKvX4B1yApqS9fxQNuuI=;
        b=hfZK3eQV2GSJwdvQCG1CHOZWG+kF3omcPSLN5Ho5DkRZs+PMFaa1GnlXMcvOznD3jy
         322z5L3mslNCxpkQZ99ZSwY8I+Vj5uqEE4ghQ9BI/sSmx1uSA0TZi/1er0dE/yqk4PD1
         bk5j4NW6aVRZejVepipHRk6/QSTPd8NCrxUcxJysnHtEznVawHC1cKSNtn/lAfMvTZxo
         cJPsQ2LL2dCjq1cgHabgQlozBq3oeqaKH/4Yd0jawYwxR5uiQGWMLYEEwuXRQyw9MAUP
         sN9Kh5mQ63HI5slWDyROttirsUtBZCpPEBw5g9/XDR4BogFSRRIdgdznIPL0Vmi9RneO
         bv6w==
X-Gm-Message-State: AOJu0Yy85ji+TC7UFSNcmX4uWX5RsV/R6EAsR6a/WYPuZha6jw9F5Hxl
	eSnusHKpufO54q1L8PU4erWvSlvamz9n986kBbnVBseNUN1Qb2/j2hZ1QobZ2Nx5QOm09ojnKAX
	OBBoOcjWCeKJ2doefR65fdXty2rWHzG7XfWrGGrjCkEXXTA3kzqQGRXOetyy/bRly5v0cuGU=
X-Gm-Gg: ASbGncvFrzkdqBTXmTBEevp5h1Kdo1HX8Gcl3leLB5cOrfCzYFUNQyOX/KUTQ6hEMDd
	fIXm4szma5p9I34ZPYNmxvA/P3uQDEVJ3o8n3Hmc17lN5hmLMSj8rMNe7msndgea5eLLnsQaOQk
	Ft1B7MnhQn2NysCr+glfhMQ6rm9kjnqHu0TUYIVB03Tq/uIrhc2mGCH1zP9FI7n0CV8sWO/vFAX
	PcfKdY5TumdYd1+nznLvUJ0oMNm6pXxugvSij0GUHeB/cMVJ3OylmZ2qh6Z5Wr660NbqhY7AVXx
	cpHkkky2GyHMLbWhQtmsqJiQ+QH/v2Run1qGiTWXSJdAfas3aTpiSkxmFalY0ZzyDwNwVcasPLv
	IgVBw2XM7RGe9tFNFZay4n3p9jIpgCtSZHpyWHUD1No7s1eiFzF48EvAHkQ==
X-Received: by 2002:a05:622a:98e:b0:4cf:bbf8:da68 with SMTP id d75a77b69052e-4e576aaa97dmr85699221cf.52.1759566884286;
        Sat, 04 Oct 2025 01:34:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJaisveHunPf7k0r2s9PhfKtipqlgMjxQX8kJUTthH9/M9BYcFGSl6HspV5MWEb0jgA8EfFg==
X-Received: by 2002:a05:622a:98e:b0:4cf:bbf8:da68 with SMTP id d75a77b69052e-4e576aaa97dmr85699081cf.52.1759566883820;
        Sat, 04 Oct 2025 01:34:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm2632600e87.114.2025.10.04.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 01:34:42 -0700 (PDT)
Date: Sat, 4 Oct 2025 11:34:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <bqtfijdhbw3gkbtvcqrw6f7qll23cxiuhmo7etbhu2wwhxgpnq@evzypybztiti>
References: <eecbbdb8-d60c-4fb7-8401-78e6109075ec@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eecbbdb8-d60c-4fb7-8401-78e6109075ec@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfXze3uZ/V71jP2
 eEZebxB/b7e867GqSB0IaKTVwtWVuqQnLAzExzXo7x1rShp1CH3mV3qus55232U+01lpt0mlRFp
 l+t9J4FVq+lbcH6G0bOZN953k+zc657Q5cLtqxel7fauz0yHZCQwvp57bFbk4cRXS+qAazrQxDu
 VCagRnPvbvNeiOh+CTRdOZChu8+u78MJFpXUsKB6LL7ZQ79M/2zZPNLqQuZPA+OrIRTVgnpr7tM
 DSgq4e8My9/qIRqrNYWJkRdqeTnmaV7MyPFygntLB7kvZZbBxyK9jbaE/AOAzKDkG0Tr07WD8iG
 aO4seDLFAwVgwErHW+0Mjf32VFN1HkLKfY2F+eA0g91MhRQ318mKNEQdmo9M5bGO/hZQEOCGAlw
 m1yj8WTzvYBaUL8EJ5+E5EnEt/55MQ==
X-Proofpoint-GUID: 0cQJKUV-M2fx_WWi8DsqE9EmbQbRD_w1
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e0dc26 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=bjRmhQkhKgwjHQdR0UoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 0cQJKUV-M2fx_WWi8DsqE9EmbQbRD_w1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036

On Sat, Oct 04, 2025 at 12:16:00PM +0530, Venkata Kota wrote:
> The following changes since commit 757854f42d83aab44a72eedded3485887798a4fd:
> 
>   Merge branch 'amd-staging' into 'main' (2025-10-04 00:13:39 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-sa8775p-dsplemans-163
> 
> for you to fetch changes up to 80e2ccb38d412e80e2232242dab1bf5631e78560:
> 
>   qcom: Update DSP firmware for sa8775p platform (2025-10-04 12:08:29 +0530)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
