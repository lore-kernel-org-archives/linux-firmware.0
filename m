Return-Path: <SRS0=Ecnb=EA=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC331CD6E4A
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Jun 2026 13:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B8521F00898; Thu,  4 Jun 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780580343;
	b=M+2VTXMi9maCw0mgxPXxNuasv91XVQoh7FOsWv86Fr/nJyjBopVrdJL/PGW14YU4Uc7D
	 gupULW4R10lGG7lJmnuXDZNuy6ng1t/frZha06EubNPObQvNqJ0EqY++wIRPDaQ/At4ll
	 lWHfqlaauhe3L8Bhwe9dusnMHBChWVBTW2MCfF9VlGKFPor6qPdiCOZya/pMEeZ4gF8WX
	 efDx+PTmt1UGxrWuUaPUQwSNHhWvtVimz5r8YEBeIBa3hjmlhsCD6D0cf9Gns0Vh7RFbm
	 ZboCtYt5f/R1IlIjyArcP14J/eYY0iYmlFVm/RNkJPHSOy2/fI+I0DspxE7v42iS+Sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780580343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:List-Id:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJ1ehgN++cypzOYGf+rn5DwjjYVihQFVIJ3miLhE3oI=;
	b=mSJ0XaDjC8cDAvU5ZPqccfMoTnEzkE9rACkRxrgotSuDcJ7fUPVzoBPVtIqia9h4YccM
	 nY5vIzGNQXojIC9h+8sfhG0NDwRZ/qm2odWrWjlwEuxGktIDR4ngwoj7aTZA3m9IZjDCb
	 gw0nvIlhTTgDT1/+HC4k8IkrS60ngliYjSHbjrFWpPCe+PXO7BX2xoCUDeXpPi4WvDm7P
	 T2lPQ5k8NcXj2Hjp11wHueoZOAUxepJTMzkknUtWGo1xkyQUqKDc6Q5Q1ixXS3M0HsewP
	 Chji09rtCuhJGoox8w3D6h+UoL2lnz0v/kYjPlaOLf/0VSxRN55ytECyVQYLakuMd+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym1GQYfz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBiBKd6g;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F29CA1F00893
	for <linux-firmware@kernel.org>; Thu,  4 Jun 2026 13:39:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ym1GQYfz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBiBKd6g
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F29CA1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BLr9L994551
	for <linux-firmware@kernel.org>; Thu, 4 Jun 2026 13:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ1ehgN++cypzOYGf+rn5DwjjYVihQFVIJ3miLhE3oI=; b=Ym1GQYfznqKhCgQ0
	m7IR0E1/Y8isrLD5l3X6IFq9S6cVIZ3ruNe1u+Br4SrEonLyzHqxyXYiXc9Y8Z7k
	g3u1CnQdpEoMSleKmvKUEF2KP6V0b41+JhN/Qz8S5wU1eN/2us1oUsvgZi5R9uek
	AXk50bqj7h7lM1h6opU1TqyjzknXpb9mocqGtQefhqxHBDKwoWA3uMxy2QCbxohj
	sNTpxuDvqbLr/eupJyG880B6dupcIMgYcGFDI1W52GMHtCLNuQI1T81wC2721I6K
	ALpaWkGmH4tjBHyDqhugLtL+LqF0c+zbPgqxrsboKvvA5vO+yaiJOnQCbGxN02p2
	GF2FoQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek374ssq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 04 Jun 2026 13:39:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso280592137.0
        for <linux-firmware@kernel.org>; Thu, 04 Jun 2026 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780580341; x=1781185141; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJ1ehgN++cypzOYGf+rn5DwjjYVihQFVIJ3miLhE3oI=;
        b=GBiBKd6ggG4oQt60ORrwKv9+LNTRwRt2wudcWhq1bTl5ku4V8Tf0uwteNJjhOJWmrG
         uHU5J56jUSFLza/r7U2c9kC6yicUxUJHcu2akAUeIoPQY2wLkxgWebNDku+xG1H1bNko
         T7PtIcM8094kQPkYuquR2B2V0/jHJQmgWs7iKySu2lnr1TQmQ6J1OkHxg4DY1BRS+Nlv
         NJvVd511RtZpTPnVZzBTxflk5DmT0JcaD2/Hf8pOjBl8ejabHHezdpW6WPdy5nTwMNxJ
         0DRBXqBuT8tPKgyQ/EfyYbEm3kjZDhGYs6gp58GloEEbv5xMY15H18CZN/Af4G964/Yo
         9WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580341; x=1781185141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ1ehgN++cypzOYGf+rn5DwjjYVihQFVIJ3miLhE3oI=;
        b=EgelgRf+t4qwdzNOqWMaknDI2M2oseA2GFgZtFkFDyZlpvP7pxvcxvERoKJav1upqJ
         8HCO7LBbdUGp6QRBWQklxSkfN+ztNAZWgYRkY86CV3Ja+qlNZRZmidlRbiC20JsV1i10
         wCFdKh8GpLVbrhftuEOhEnSQFkyhjy4FT6eS2iDqvbnXLXCxxK8KXKZeClYVYZSai+R1
         n/dlnAQtnLhjZGDKtjVgScTbpOg6ty+bf+buKcdtUK40ebM748Prjxr3sKeCLWDeF+RF
         WYmAgrQ7yCaNCuV5XlEzDPEng9jV590YcbJuKyumrbulXTWTyZx0sMyOSGooOdYI+V8h
         PCLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pkt3OQ4bss8TFLaoU9ftqR5l8D0ghCFzSM3RemkkhRL7hRs+ASOFCnL9NlaVmvCPZeCZceIfJWEDUiVIFeA==@kernel.org
X-Gm-Message-State: AOJu0Ywrn5dnCNnr4tV54S2WCcJNPPSc9w0lkmpYlcoigmFgyF9jtATi
	GNGBKUyKd/3i9OAZyhPgs7l2HYkno5LK9/gvWUFAXenTuefJLGRyKgkcSYtijxuyA4bAkdslmJg
	nlWveTV2WDrxtDkduICzJ8ANWG+0XpnEt1F7D4gGom1Vfur6JiASdPu1vbWwn2YOzXsYyXj3e5c
	Bj
X-Gm-Gg: Acq92OGN3jVu1hucvvXgbOi5qwHINr5Om8i/EmjN9h/FFs7vSoxEtoUbLlnvfH0dM9I
	M2toHvmeHZ5j4xxLsOIoBNEJx1kRB2vFT4kbyXesIQTDzz6OF2NIyU9qySaHUZZCFYcMLdH9Ifk
	mdUmyZMJ9Cb/DnjJZCopVjS40WpqTgOH8PeOzeWJZSNDf7GHz7a9cxJ4cp42Jl79aMBnm5CYn5W
	Ups/soHxqGr9Kj/TgmQuv2f96fUvYWozqhWaSGXBjZ2TaLLEfUJpdULZa0JOu5SYFggYCJbiKdn
	CppDK/BuoO17PBGy9vlfgWkQbPqesztPi8fYOQJLvgabv+4tuPFgfmr7yalwk4kXoUnWuc4veSO
	hz3R6r705fqmn2pkyzeryVnNpTcGpjzH/+gRquOz4GoZ1mBECqucg6fMO5OS9p+FeOr7Nd0IrhQ
	sZXjY9WGrIbvNsaXQrkaUpW+MLfaNHs/atcoP8HElpeJWhBlUFczhDquRGvPZZxU98P8cqSzzpd
	EBhgyrIkxORD3LCQQ==
X-Received: by 2002:a05:6102:3e26:b0:622:702c:fd3f with SMTP id ada2fe7eead31-6ec4881837cmr4242981137.21.1780580340896;
        Thu, 04 Jun 2026 06:39:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3e26:b0:622:702c:fd3f with SMTP id ada2fe7eead31-6ec4881837cmr4242963137.21.1780580340304;
        Thu, 04 Jun 2026 06:39:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:698:e35c:88dc:c22a:554b:8dbc? (2001-14bb-698-e35c-88dc-c22a-554b-8dbc.rev.dnainternet.fi. [2001:14bb:698:e35c:88dc:c22a:554b:8dbc])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9903e9sm1199230e87.69.2026.06.04.06.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 06:38:59 -0700 (PDT)
Message-ID: <c75a9c16-580e-4c44-86f2-113a8263e642@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 15:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update CDSP firmware for x1e80100 platform
List-Id: <linux-firmware.lore.kernel.org>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>, linux-firmware@kernel.org
References: <f3a6a44a-43c5-4c99-9e39-9b0f0a91ebaf@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <f3a6a44a-43c5-4c99-9e39-9b0f0a91ebaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEzMiBTYWx0ZWRfX5ToUmUebK5PN
 Qlhc1fXB1PbvYSfQYEkB39DcOs8bLISkkrsUIQgXzRzEJGkCtCxMsZqEdrTnVVZ64ir1dL42Ii8
 tJy5yM9WSx+RC0Lyuw/qWHEWiJ2viA+emNuEOxOGuYc7E0tu+mXnEGFgSzKZtUWYtbqNqcbKg9G
 ycWDHGjxqi093g4K1OsPerDHldXfw/KPpOoS7JcFs2oVXGpN1N5obqp3hI4kjaX9vQesGwaU1s+
 KGi5iMJu/5pvMzlbtEFpcOBYS7cNfIYAVUHYPugjpjRUL6v51T4O+pqaFCvMU5559f4/jBnNbnu
 sR80+BQ3/c+mXlOAlhpQWHV2nVjlNAr5D2RCzW5h9axtdbmymYmq1K3jNillykyKDM9Ct8moXJP
 ru5Fl1/iUUqTw581XB98XEHC4uThFY4stafmuaBRY+WcpkNM401SIBhxq0HUFl0E/RqUjQF5QKn
 k6OEC4zoc9gzLLI8+cQ==
X-Proofpoint-GUID: cmiUAZbToxixLRspF7fnoWxL57t1MAyD
X-Proofpoint-ORIG-GUID: cmiUAZbToxixLRspF7fnoWxL57t1MAyD
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a217ff6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=GcGxWe33mYEYoVCCi9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040132

On 04/06/2026 12:06, Venkata Kota wrote:
> The following changes since commit 
> d953ad875636676424a622ab91cab51b97a0f50c:
> 
>    Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dspfw- 
> cdsp-hamoa
> 
> for you to fetch changes up to 9051fa1b753accf241d00f049e131d8f9f918dcb:
> 
>    qcom: update CDSP firmware for x1e80100 platform (2026-06-04 15:32:12 
> +0530)

Merged and pushed out, 
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1077

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: update CDSP firmware for x1e80100 platform
> 
>   WHENCE                     |   2 +-
>   qcom/x1e80100/cdsp.mbn     | Bin 3215784 -> 3215784 bytes
>   qcom/x1e80100/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>   3 files changed, 1 insertion(+), 1 deletion(-)


-- 
With best wishes
Dmitry
