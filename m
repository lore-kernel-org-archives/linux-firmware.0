Return-Path: <SRS0=5Ed8=B6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31F910F3DC8
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Mar 2026 14:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76F52C19423; Mon, 30 Mar 2026 14:00:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0652C4CEF7
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 14:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0652C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDl4TS2458297
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 14:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VtiJfb/chQtfeMNUR92GVEfX
	7tyC5PkPG2RufCoKvGk=; b=fF8f28nRLG2ivIZNRVJYVzBXYxxkv6r/5FN1r04k
	oYmZAxV837wyo9bGp155XKFh+OSGO5PnTXnnUKlPpiPx025othWapxxZDbUEZ13Z
	7T9RStLfix1NoruQeJUPC/Lpm0Pz3ytjFriSklG7L4ou+KD7JvCgU9Diai6k0wvX
	Eb9F6R9LlfwZdNe05kx6x93aeM6PmB61rrmd4sFaKczBw1n4mV+nS1ntZ7fi9UtP
	suRKeydzxqrJ7M+Ld8fafJEE6bqj35l1BKTbyX0P6U5QOwf3Az5i9IufIBSOFfJy
	LArdfiAAOaMGnU4KcxFZdLZVTQFAVAAVvXTU3xWuVjt1fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmsc9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 14:00:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso41640051cf.3
        for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774879234; x=1775484034; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VtiJfb/chQtfeMNUR92GVEfX7tyC5PkPG2RufCoKvGk=;
        b=IpuP2pohB98LO8plMRV41AdPXQMBoqM9/JoW85EO4WBoaVxUjCeGfLPoCKbJPURx2C
         3S7DRLN9PmS7s3eUi1wksFL8Hwmb44x2eKxreLkDgNoTcTH9kSfyCnhV7pqbXuHdYsQO
         B3+8KY8vic5M/oVj1tvgpBlF/jfezEA0gaiynYGh/pqPgbuufIkyxp4POeD0nHvVZu/e
         a5Ev7hFQXNiLFVozn0raxw32BTa5jwt8uEkSfKFq8bKeZ7pSjtBVKHafuW926NeHXw6g
         dJ8tMQKhyXlmDrvcYI0WQi8wVQ/o8Cp1SIAyC5MRdswBhQV6KG4yGA49JMAFE94BUhGh
         Ag8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879234; x=1775484034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtiJfb/chQtfeMNUR92GVEfX7tyC5PkPG2RufCoKvGk=;
        b=GWSGAN9LQpwKwttMY8AtWTWYUP/L3b7It2zvT0VGaEud3nqkUToIlntKwpzNjIvnoe
         8M6bD83wJNTlve57U/RwnNPmGwp49at15kGyrv/8G+vfq24on9gc9e1uGVn7rpF5scva
         55e0j75T/UIKvoknk5jxM3uF3u8NHQU2AO+G6jmJ3udSaNOie1Cw0BFDyDfn164BDxOJ
         TWUQFuPycWW4IFON67HPTIfk833W43LTysasMdjJ3G8xnw1CdA33rusEywPhGaPkxGUY
         00GmSHwerDFqsNCcT6cuKXAKTGCSv5N5LMziI4TNK/mlGnD6gUqyW0XweErkvj6rzUNx
         IE+g==
X-Gm-Message-State: AOJu0Ywt+kjP6Mas5B7A99l/s9gZ5UUHwp96cU/l/AUgmN3Ve2sDowjk
	H1jJCaXj0TjKph8x5AR6STc84R0Ymy6xeNxQK6Taje1H1illwMr/U+f+Vn2Lbmky5sWEQpChWrf
	6TYmRavB6CDwvlNMV/WknOpd/PZnWB0i+mqE1wPlmOsh74HYV1ABydl2vAfH76fwb046A/iE=
X-Gm-Gg: ATEYQzx8u7ENg0VXT8lKV6kUsrTSmRaLcXxElSbg9aQXV+nPWPmERsL1t0nCjW9zmoZ
	jbXHHwfstDzWFlv2E8dIKkPx2yqea9ab4KgDraqvxAofxevIk2sng8lE7QiTZSsNoRSc0k1NLSL
	3j+wqgZyhzHps2GpCEmc05nAd3tClpw6uJH6xH4JHsrZ2dCpWeJv74nmJbO/xtAm3QU4z4Qn9VD
	BTvmcJGGApt2Hd6j9awh4FqA7PE0uSTDklN7vstafjO7F9exnCXuqKhxTzrdHOtSYsSzp4RZFk0
	mnCUjzThsOoicOtiFZ2wlzXV2czAk9Nn5MCeu1LP+JI7XL6dTw62Cd8GrnxKwNsBwqLdlDHnt/t
	8W1m1CXVmb4eEKBGpUbRSq5xY6zD2/PSEJ8ZzrlF3C7o0OwOqI5gZp8pQUB8VH6uFWaWJJXIJVe
	ROWn0FZb7rBhNL+GciBkrxWFlQ9XzWC6Y66jw=
X-Received: by 2002:ac8:58c1:0:b0:50b:50a5:d61e with SMTP id d75a77b69052e-50ba38365cfmr166287711cf.17.1774879232382;
        Mon, 30 Mar 2026 07:00:32 -0700 (PDT)
X-Received: by 2002:ac8:58c1:0:b0:50b:50a5:d61e with SMTP id d75a77b69052e-50ba38365cfmr166286171cf.17.1774879231334;
        Mon, 30 Mar 2026 07:00:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4d3sm1663405e87.34.2026.03.30.07.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:00:30 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:00:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: add video firmware for SM8450
Message-ID: <sex3r6hv6ncfu4p5zf4odxvlloekbv3uvnwqclvmpynwxzvos7@6yviq3dit3ke>
References: <94396d37-1f41-6dda-1527-32818bfbec54@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94396d37-1f41-6dda-1527-32818bfbec54@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwOSBTYWx0ZWRfX2wQTfMcpiOYm
 ttOd1QBxKu576o4RdzUxq6882rH6VYwsuPITOI7rALE9wTwtImQSPj/qZGuf1NVIUQOxZ4l3ayf
 NrpI8amrqNnTCXnL+FWt4t2PXgEN9i8XXdVrikbEBPuDkYczGmo8vd0pKG2Fc+OD7ZHUkCsP8Aj
 QAkOrn8HLVEwLs375aOrdlwFxTxKIivHOdrkOKvI5L4aAcOPjbeMbWhImwi4FWvwlGsikWlFLBC
 2NwAdAzXZdl8e02UtW2qW8w2VNXFxoAOnqEqJ8bgfh9smU15vt9EmOktW8XgiAIx57bsWpQjwUO
 dgTYtvxhLcmRU2oieRTCcVknBWIN7xu0PFA8mUsvbw8f73myP3IRR+0vjuCQG9GvWGRCuUK6u9q
 bn9J05pGNEvjAEXxBjki+pQVglcCr3NG2/FaqW4GDHVQMoeA0LRL5oQrP7U8HGP2lR+B6RI2M+E
 5PTpkXnZZoLG0hDyYpQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca8203 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=GDM40FOp9DZjrmPrn5IA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: CVSEeR75gVVMT18q4_kmCLc_QBNBD3h7
X-Proofpoint-ORIG-GUID: CVSEeR75gVVMT18q4_kmCLc_QBNBD3h7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300109

On Fri, Mar 27, 2026 at 10:26:21AM +0530, Dikshita Agarwal wrote:
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add video firmware for SM8450

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/978

> 
>  WHENCE                          |   4 ++++
>  qcom/vpu/vpu20_p4_sm8450_s7.mbn | Bin 0 -> 2024040 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu20_p4_sm8450_s7.mbn
> 
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
