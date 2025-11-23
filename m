Return-Path: <SRS0=tsBH=57=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD4ECFA46B
	for <linux-firmware@archiver.kernel.org>; Sun, 23 Nov 2025 14:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDA79C116D0; Sun, 23 Nov 2025 14:12:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA2C7C113D0
	for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 14:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA2C7C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANBvBw71264041
	for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 14:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PeEujRzk5nev5AXguQkg72aS/B0AHQKlpKDsL4zs7ag=; b=nJUgA1coI1liLzFw
	oP3I+4Vccq9vmIP+V+Mo8XsC/is8pFfkL3PBKMnpmK9ERxv7X1MD3i/BSSvtXcNO
	GnHMjgTScRJd8remoRO6v7/zUTIAXLL2FzYTeAFtAyD/WNdt1iE8H9cStHBIjEZV
	yWMuHF7+XzwmA9IJzEh1IiwvvZrMQ4ATRpBUjXOBCY1iqI0Dp2vpJsLQXOzQvY3I
	m3uBnAxCB8DSDFxWnb79G2TvczzkNpMqXVFWqDdDDsyvKUYH+c+DRK6rQDKAfqob
	Aw+1vjj9uXbGtXsV4+nMUL0DDKfdZ1HNj9yXlD92UoP6MOANfPxis9mvtcbD+C0V
	0ZHN/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdte0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 14:11:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed82af96faso86527461cf.1
        for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763907113; x=1764511913; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PeEujRzk5nev5AXguQkg72aS/B0AHQKlpKDsL4zs7ag=;
        b=hZfCD7G4+cKCKpzSbJ1waMNfFl7Fy2eTtMbcJAqoPBBXPhvLr3c7zf/6n5a3T4I/4d
         04SXBI4hXTeqSlx5UnZ08zpfn/qRw1wu7W+35oIfuWYmhresd9Cp7rlO15jogWdYxoI4
         z2y3ORHpSEWarV9k8w1KmqeQw3d/slCmLsjbOT8o/NJYNCdRccMg059agSAoj23BYYBr
         g1s0Zy0kdXuzEBRRyyGetRjeE7rVEiw9kfbvKlNOh6AtJaYd21RG7GOFFTTRWZVLk8+n
         5LvPVBJdwfrVouI72SqqbmHY/WWHpkei6A8GIeDvk/kCyWGmJLSxOtux83fr2QeMeLyA
         I4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763907113; x=1764511913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeEujRzk5nev5AXguQkg72aS/B0AHQKlpKDsL4zs7ag=;
        b=fuq301vaZ/u881YzxXicw7ODhnMxhx1U884lHzfRu9Q5JodoV3WcMAmd5osdtBIWdV
         ZJsTpBbofnsEEh9vEUSkDBsPSSWfUFso/vycv8aK39zASGdSa1KEIcSni9bI1rH3aepZ
         Ck/euvTLOBtVA9VGvtAmLdsYdANQqYwKdfkdDLEkZk9BUBSsM4+pgOJ35vz9xc59sO27
         QlaLvr6dGlYin3fBa11W9kvaZpncW0jekZDd8uLXXvN2IKDR7elFXXWO9hwrdStfneNh
         gJitIoH81wA283ryl0oECqCx/mogU7L3ic9coCJJmJI4GycltWedrMBkYRr5DnvIU/oH
         z+Ww==
X-Gm-Message-State: AOJu0YwgXsg+iBtS2WpW6RKmLeZZfnb+3c2kls44XYerNlNXhdzLUpnD
	0a354g+JAKb23UEBdJTni7uZcHuGItGC54QhoTbAiH7MbyPUfLzomaImeGpoWRti3QLZD3C1Scz
	aPO5WQxihrU0Tpdv68CHfrRjGmXqb2nhARU1/R3gPOhr5bkZ84E9b0z37w3KyEY8=
X-Gm-Gg: ASbGncsM/K1j5K8d6AlAkt0JpSJu/fKbPl7iI46nAD336G/pIlskucctQdvhridZSFR
	M1qJJ5GmvtdAnINntGCO5d46DmZQoIN5cMqJIc/HRgkRkOFlRgrYLfdDoHq69R3G4fUyc+9PQ9s
	FPsgz6UoLcWjgZ6Y5MkW94Q2NMYOiHGXq9GTOqe4U+gpQB4Rud1wCIY2EWuudPYgCRXUYtcm5Qt
	anStztwZ4nnCxtKGJaYGUqR9kd1U5RwfN6V2fth9PmEFPBN2yaUabAkWU3bV4JhcbtBUUFqZ3I2
	eGWLjyA9tWxkcn5fW8Sv3UtiZFf7Qctb0JQDq8lV4blzFpYaz+yqaX4QAXcmmEtx5fuK5iGDySX
	RzWmCIclywAahFY0ODX6ghk8MRpUOLLHa/Ry1BRoTcfrbIPchkaCqJk5uxojR0Bhsb5Ch1bijCZ
	AtHF6t1zKi4hW6LEAND5u/4Hc=
X-Received: by 2002:a05:622a:1386:b0:4ed:542:bb38 with SMTP id d75a77b69052e-4ee58af89e4mr129200321cf.74.1763907113503;
        Sun, 23 Nov 2025 06:11:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8gfzBFOL5hY8a0oaQl6/iemABVw9pVmFmHN2WnhvTP+ITEu3KhhBj8kRnOkebXCucnbNyg==
X-Received: by 2002:a05:622a:1386:b0:4ed:542:bb38 with SMTP id d75a77b69052e-4ee58af89e4mr129199691cf.74.1763907112861;
        Sun, 23 Nov 2025 06:11:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75731sm3247061e87.1.2025.11.23.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:11:52 -0800 (PST)
Date: Sun, 23 Nov 2025 16:11:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <renjiang.han@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: update firmware binary for v5.4
Message-ID: <umzkvpxgwxjhaamdif4id3ngu2xrdvodyd64abc3obcrftccwg@dejqillpsk3q>
References: <12237382-ae28-45d8-9da1-af700cc22baf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12237382-ae28-45d8-9da1-af700cc22baf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=6923162a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=LToGtISWNv_UeVNle7YA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: w-cwG06vGfkPqAsjHA9ywqgsreOFTZTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDEyOCBTYWx0ZWRfX2uFZ2qdWRo5Q
 QqzMS97I1P/Qusm8H+KdIR34Ja5NYCX5CFJGRnRFmzY9FSlpIt5tB38VQ0Dq1EeV8fio9OVG/TJ
 VQh4Z58lU4nMsYkZuhkctOG7AXazrb06G9avveJpe0KN1RDgiMdD64WxP8JT8jHM24FLkGArqAI
 y7ZuFvowCssXDgF8Jz0HkN58kItDCgmxYuKP/w4Vo64EprjwS27yj99DnqmINr2NWm/iy1Rc2QY
 jVj88al3quFv/jl6oOcwoPdKx2VDbPF5yyjhCno0XkWiXIkdyHwU/yLwrrAqgcKyRHvOJnY4+fa
 8s9Km+A+nT86p/kljEpSTxKCgrk3S+6PHXiECdt7h9Jm5TsPV4tiam/skrzZ2tmE5bPPex377C9
 SYxRcHvs6PLIG4+j0AlyjEs+RvmTcQ==
X-Proofpoint-GUID: w-cwG06vGfkPqAsjHA9ywqgsreOFTZTp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230128

On Fri, Nov 21, 2025 at 12:11:02PM +0800, Renjiang Han wrote:
> Hi
> 
> The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:
> 
>   Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 12:02:02
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> update-video-fw-v5.4
> 
> for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:
> 
>   qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41
> +0530)
> 
> ----------------------------------------------------------------
> Renjiang Han (2):
>       qcom: venus-5.4: remove unused firmware file
>       qcom: venus-5.4: update firmware binary for v5.4

I've set to be merged, https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/793

In future, please, write better explanations in commit messages. Target
people who will read it in attempt to understand if it should be picked
up for something like Debian stable rather than your close colleagues
who perfectly know what the issue is.

Also please coordinate your uploads with Vikash and Dikshita. The _s2
suffix was totally not in line with other suffixes used beforehand or
after.

> 
>  WHENCE                      |   6 +-----
>  qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>  qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>  3 files changed, 1 insertion(+), 5 deletions(-)
>  delete mode 100644 qcom/venus-5.4/venus_s2.mbn
> 
> -- 
> Best regards,
> Renjiang Han
> 

-- 
With best wishes
Dmitry
