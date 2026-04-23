Return-Path: <SRS0=XaTs=CW=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD929F99351
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 09:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6626C2BCB2; Thu, 23 Apr 2026 09:08:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C878BC2BCAF
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C878BC2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94jlL2319458
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/S8Z6NWVDjMBiy/UVBGYRoK5
	KgaeP8jrD6qTCTUqFhA=; b=b1RT4GoWsl7Reg9jsRG2HzEMMlH38dWsVSghxj0r
	zr6IRm/zw+sw5K0EnWgFB3wyt2K3XOGMGMicN7JD4lCf5k3Hp/NUKoLMOFRxkn7h
	o9VCy814h3RbWEL8qgD2Zp0jLCvxHfvMZLfw7VaMhX9H3CbYy4hLPfNSa+csrtly
	je84CHG4ZLD/pwqFOER5iZAeu7fyrQHwjixbc6YLwzQEiCTlio06c63qCsFz9r9v
	Vzgw70JBN0ae1jUWKyfllphzJgdmz0C2G5iQVolFoYs5dhZpXVV6oTW0nbPUqmdw
	aKyZcvIjw8F0fMl0dgFwuv0laLDCoxTRgleEEmp+CN5nKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsr0fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 09:08:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so120091055ad.0
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 02:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776935304; cv=none;
        d=google.com; s=arc-20240605;
        b=VC8G/C1v8xVDJmXm8mXVmr8b9MZgtESGllWFVaWtsGiRJa2G3Le1jxdZV30noudn8d
         hKIEU5EIqFUrCRMUtYOFr4CLD70MqkklRFSP9HkbEP43SVul8PAZLCwv8lCF1ayb+Z9b
         FPiGKkwHk+OiUzePNyvPz20orgll2/ePdUAdLh/A3Jsce9/ez2jzIZV6Sv3mN5O0/l+i
         rc/q5LnEIyk9qySjx+uRb/UFOPcNHCMuZDWL1MIZlSlay4E6GOL9q9M8ixZvXf7fg+Ir
         CN5tGsoBJyf6ktgNWds6vyF77mBWp3TNQ9kEeS2y0zjDWwQTTmHXdwNCA810vMOgk3sj
         EzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/S8Z6NWVDjMBiy/UVBGYRoK5KgaeP8jrD6qTCTUqFhA=;
        fh=62tZUuFD8zmC58yWj84f/RiwrEkU9WJ4Vdk6NLs/W/0=;
        b=gEzqH6VQdWkkazeQPm/QPaHAk/rws26HUprZpeuKJ3T9Foo78Q3Pk/yg7Dd4JoJfCC
         94j4y+Px96KMERiCX3CXiB0O+17nYXcU2CdLRwVO32gAlcNIV+piPZ7HFOmCZHfPE2jc
         02iiJPi3EUjAjp8iudMEYTkIrr9Cad38zt9BnQWHiANgR2oqsXHULVHo4ZmEfDop0TRW
         3Cby3J0WOjLlCRt51dDqgTDQSFWNXonUtN15QFUKL4zHVfuwO4S49DK6e0uS4ecZo9eU
         IUJRMUlWkXk52ZwfYb5lrgTtMTRHzq8zeHdDgCKxAM4Ihnh2MW4qlESHyVSZQaFd9Hl1
         oHGg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935304; x=1777540104; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/S8Z6NWVDjMBiy/UVBGYRoK5KgaeP8jrD6qTCTUqFhA=;
        b=Tn+EqztKWLtTArDumO6+LYKyIpEHQwZS8rK0SMFqZAkmq4xAZL0Bd6ckMX6g+d3pUX
         43LJ3UuSVPFddK5Gzs4pzI1gMFNZmr0JelguA8iv9tBnZo/EeHWGvbqEBxvdw+xhJQFp
         ljvupFOAHFZSi/vdltopEBgyZDGW0loekEZCHhbBbTdDLx5scOHQhYMa4gG0gnslgKvH
         az8+IWHiTfhFOBKX2cI6UfAgBw1s3ixnD+i8jynEKiYSOJpuvrJhxXXiynvwuwcF69fF
         dO/VjbaiPNgEco+ek5gABCPP3eEv03Qk8s0rZml85/GcT6MJEmif9yYJsdFnF1Hvl7bn
         F5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935304; x=1777540104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/S8Z6NWVDjMBiy/UVBGYRoK5KgaeP8jrD6qTCTUqFhA=;
        b=hHOq4evKIe9j62b11INm42UuyQkdp4WMpwd08268IAwVg56ZBCwRmAnDK+MoAKb0Lp
         zOF7s3KJAhPMTS/sxuLChh1iMrsbcnbBhT+A0pPRlv9aomSUapBHHbi1tivzrQpKNMqu
         q0NCVDc75CFM9CQS8ACZIsDlJkPNX+c+lvbTnpFdJ5iJpUiT+n3bEP5IaZJweCdnV3AK
         GL7Sb0LnEoDW5IxVUsMWTZ/099SnE9u+PEMycaXc0fPAVd9qwjKgcvd1GRspn5BRIOQx
         SwEuVMIhJZS+kgFQfChLue4iR06nk6UniiKSwPOwYUALsCD08p0Gxh1MF3jyMdqkXtpe
         fhwg==
X-Gm-Message-State: AOJu0YzVE54x3ABAvA+ChyzHuSzm5gnZQH1/g+xbqC15g98ZP2/pbekK
	NiD7QB1V8kUBtfvCegGGCi27SSck3qJhmtlOkPtMTLsZTBakmYEg7ZNxPwTcSjZK145oobtmxHq
	iIgfUSZ0dIsRFqEeL6PvcWWM1qx5QuS0d8nlxJObmOKAL40MdxfFCa+MRE4iCJ/kD4Dm3RevKzt
	IW+xDhhHWBax4Yfq3phUK/VTJjve+n3Gbh6uviMg==
X-Gm-Gg: AeBDiesahHx7c4WAYEFjS3XNyiUd2tS7O9rSezSkrPsHIqMm3IOrkRHKnrICKVVomKA
	OLKnr0S+3JpxfPAvScrNOCQxmqIwbwuWf1vzMTV1y7JJ7EwSGd5ZKgE0aQfu1HNweEl/d4U2/hp
	23wd+szyEVipdKq5fJ1PiehiZs3ve72uGoLxwNswMuqK4xGEhwhEPxhgZB88BIqOf2jkJZdTYEs
	DVKB72DwoYSfBA7Mw==
X-Received: by 2002:a05:6a20:2195:b0:398:7792:3882 with SMTP id adf61e73a8af0-3a08d703f18mr22361650637.16.1776935303918;
        Thu, 23 Apr 2026 02:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:2195:b0:398:7792:3882 with SMTP id
 adf61e73a8af0-3a08d703f18mr22361627637.16.1776935303436; Thu, 23 Apr 2026
 02:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <a53ffa62-1501-4225-b864-cdb1788beb67@oss.qualcomm.com>
In-Reply-To: <a53ffa62-1501-4225-b864-cdb1788beb67@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:08:12 +0300
X-Gm-Features: AQROBzCOAgFXmQJO_4K6894Mol2puX-FBe3zjLKG1JJDj5Wkq1g4Ox06NtD884Y
Message-ID: <CAO9ioeV_uqq2dKafV+XZAEgjV5sN_jk_r3s6aR=SMju1rpmQdw@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for Glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Oj7fqrfqMp96H5Z9FHKUfSNEXz4dTDqB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NyBTYWx0ZWRfXwaZBQsd/LbYp
 gm85h8LNPcvtvpwGSo/dTVsDUqWnEHzB0Y6zhMZvk8tC8K8lPkq97Z90l19Gj8FGYSnzGQdOjJ0
 UngRXypeVIlXNojgHVsVcsTM9PQFOrfbF6OPcPOd2CtyziRCfGuVZJM5QSWZBDn8w5sUxxUrY5s
 O/bp3t9fN0OHY0dHTyf+DcriyClIR+wQv+nORhvSV2Ba5LZW9xX0fz7wUcY9jrAz7uN0LG+jqoi
 J2LC3hjCz85VknPeOOILu5liIxGe6QjOaQkIm3b0hE7v8i362Shofvx1pMkHQ4Zc3WpcuFSfsCe
 e25RV47y0JdM6Q0MmPbMdvK1TnZqixAYtIDoYwc5b86R9VDW2UsRz7U0lkJvSwqH6+3j8hhP5c5
 HT1cFafwHZWE1eJcqXCYC+W7gsjD4tr65SXZSwZFFkO9ab43Gz+J3yreoY5ZzZhIGYVxhVfPXsy
 g64zILmUGuF86cgCYmA==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69e9e188 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=brh6ilYfUk0RbE_vqWAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Oj7fqrfqMp96H5Z9FHKUfSNEXz4dTDqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230087

On Thu, 23 Apr 2026 at 09:51, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
>
>    Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-glymur
>
> for you to fetch changes up to 4a74616a3522816f6f33297219f9f27cfa4e3268:
>
>    qcom: Update ADSP firmware for Glymur platform (2026-04-23 12:18:50
> +0530)

You forgot to push the tree to the repo

>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Update ADSP firmware for Glymur platform
>
>   WHENCE                   |   2 +-
>   qcom/glymur/adsp.mbn     | Bin 18622472 -> 17049560 bytes
>   qcom/glymur/adsp_dtb.mbn | Bin 233272 -> 225080 bytes
>   3 files changed, 1 insertion(+), 1 deletion(-)



-- 
With best wishes
Dmitry
