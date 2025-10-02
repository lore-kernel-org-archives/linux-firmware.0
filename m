Return-Path: <SRS0=yklG=4L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CDFCCA470
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 01:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1D3BC4CEF5; Thu,  2 Oct 2025 01:52:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AE8FC4CEF1
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 01:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AE8FC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcUjX024838
	for <linux-firmware@kernel.org>; Thu, 2 Oct 2025 01:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b7OKjTtqAPjS3VPPULQiJORD
	LW6HMfO9Cw1yOGeE6NY=; b=ghxrJbrtcwwmxIbtuXvzBkRNDg4HlENRfIt8Nx5N
	epW57Wz86IkclYDb0TS9IGpaswQSeLn7hgKFquA/gkAyhK11H5HJFv5VLLr3r3g9
	tI9/t63PsXkP+57Ok0RHHzG50830pv2fYQMAj/P/x916V/AW3j3KTtgre2rDxzBY
	7hcveTqBq70PxIF2ozrsCL5ztGvuoVpInrlBFrpkRtQnhwUcyDzaOoq4uITHPrQH
	0IdxGWfdy0DHtTsz/1HSKOTT0Ir4skfXt5xGDBIkUWr2vgVKg/5JMAJnSs3ybegw
	0Y+wwflJevykK7goAswM0BqIyWFXsS+pE96ku9jfkr9vxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977x7ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 01:52:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dfc05dec2fso18598171cf.3
        for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 18:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759369941; x=1759974741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7OKjTtqAPjS3VPPULQiJORDLW6HMfO9Cw1yOGeE6NY=;
        b=HQ/ttpQ372FldOuaJ+6HHSrEDHRzN9PsXwSf57dQj3KWRETQlZ5ZafnAxaZCrajTMr
         UF848hF1+sd+qNSnUcO/U8ydn9GfIDglqGcPJi84i2aOydQSip86Wn25QqWPkYnOF4u8
         M99vZm/DuuL318Hziptt29VISIU2PoZWA27sYVGFvlhNAK9ppdtjFURtgIWn70gQvVkm
         8UQb5pMtHeG7XZHfPoyuOMC/KC2haDP36++xBcKXbNypNwGf6zkKXgDV5O3dlpSbgXX5
         k7cZ0gAvoswYIUmtjlOczmOV21TZi2mlpL6+hq4D/7h4eKj6XNteX+Qmrq+4+P6NrVoD
         G2/g==
X-Gm-Message-State: AOJu0YzhJY3iz0hQUZzMSs36VYfKrgpkhUqYYNmKSLLFeq5JnDZ9C1XR
	gNSVIFujdPNJXHOnxpW2Co9jZOx4nlT1PCYTSh0a64byWqa1YImueimjY1+C5x1wuKFpfpHrGWI
	24/GFapT72360KfpRkNx3T2VJCaqs4YOe0meJyvgQ70618pdxSEeMVHIfKLe0V2g=
X-Gm-Gg: ASbGncv2hRlLmCUknLODWH2r8C+2mWfaMj3z/H4xZUgOIYhTuavV5glkQu9kjIjYMcp
	IufKyAFL2qHcybP7ITk17vFR7BwKRrnF1AaBlHOuUFBx4qX7kus8GE0+qto2j4FX5MvaC2Ue4ec
	+9In07lvIwUqlZZWMQIbHmvh9TmPtC/DmiO5LDuqkc5bvBsuws3f54IUhDvBYmd+T5kTtor5b7s
	oo81pvUK6QRFuG8Ds+Kn+qk3xkzehB5dO1gMbn7jvCJstvS4m4Vlojnloqb8ehSoOXRIeTkG6I2
	i4SGZZw85BgWSvlu6RyoAT9v9aD5BfpO6aVrEzUmVpOQQSbhlzAba0kkYJbpthv3x8Swj04FQWD
	4QxDTw1C/atFV6P5ZoG4FLswnRX+xQyWwX/PYeSfWoCKLlsmUsI9UF4lwhQ==
X-Received: by 2002:a05:622a:309:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e41de7315amr69241981cf.69.1759369940632;
        Wed, 01 Oct 2025 18:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzv3JW6aiOVT3Bq1jZSZtsvihzOxT+DHPbYNsrKy7GawqudOdST9SDiHIUSlukwPALJtDL/g==
X-Received: by 2002:a05:622a:309:b0:4d6:acc6:752f with SMTP id d75a77b69052e-4e41de7315amr69241831cf.69.1759369940166;
        Wed, 01 Oct 2025 18:52:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4a47acsm3128471fa.44.2025.10.01.18.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:52:17 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:52:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: update video firmware binary for SM8550
Message-ID: <cxo6jagoe5dnlrnezjqlbnchxnkyqnce42vbikpzgyi2vdecof@lngzd5nrd25u>
References: <ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com>
X-Proofpoint-GUID: 7wDISRiUylZ5VfZXOk-HIjVgXlcUtXB5
X-Proofpoint-ORIG-GUID: 7wDISRiUylZ5VfZXOk-HIjVgXlcUtXB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX8NjIjzCU7yI+
 BDtB1FHQanTIsh/GgrwAC9cJKZK2wKOBB0arryNT6WnrhLgxUFtlnQK6OoEGxOz6wjQSVN0bGVx
 C5kRh75uJrITFpaA/d3ZXZ57FvNFb4vrt72FkcmTa6P5Y983Idak/e7S0VrcAYRJZMNLusRtW2b
 2O1p04LfOcejWzmbjdek5mBeno1emdO9rcAkCefF2rQXxQAX/awYAQwSROjhGxKJDazXzKnQ3Eb
 EtMD526Z1+6wwhcQm98tDcrm2PsKxSgtG1laiW/Ympbqi5ZqN999bWouOFV4ykRv7u2/URodHkG
 m9oINOuUOOMQ2BOujeEE9ao/ReDkUk5BI7kIG+blwfi+aCzm2io/f64akxvkmfTe3AF84k4hB5/
 BrO3ZJl8PpFY/Jb0hhCJIQSACwGImQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dddad6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=3tC-QKQjHxqf3ekEsScA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On Wed, Oct 01, 2025 at 05:09:37PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
> 
>   Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-sm8550-update
> 
> for you to fetch changes up to 208c760dc79677e0ab4fa596e23e4dd9394e00c3:
> 
>   qcom: vpu: update video firmware binary for SM8550 (2025-10-01 12:14:09
> +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: update video firmware binary for SM8550

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
