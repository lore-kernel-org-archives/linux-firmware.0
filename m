Return-Path: <SRS0=1bc9=FK=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D68BC4450A
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jul 2026 08:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D93041F00A3A; Thu, 16 Jul 2026 08:39:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784191150;
	b=sQkTrzOL/88bxFam6Ymo6Gb62l6gikRwpcmuNo5wmEUXQkEydaUlENHexljX6Ly70of3
	 EcjtnPfHZELgLNDythjck9P7wtOzdyrjBsjc0lnpc7ae/9c4Xmub0Y/6jqN9vKjPcNwDe
	 52otsUfi218FRpFQA5r97ZmHozCaAhuMnd9zrn2ZP4w+uLeBmIre8hwGRBpV0FiIGYlJo
	 lpOejChn97zN9/xiDWBLYiWwiybiIS8zVz+LPbhBzadI8qdtmUrZS3aZvOP8xqZWhTTva
	 AjE+0MW2N+C8D6Efxox4KP1964ZidCbUNQPrmrtgnAtQqKdxMKtSeBn8GGWFbguOW8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784191150;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/jOrd3DRqifk/50rwMGbDVSiDekpN+KoEvMP360iuSc=;
	b=eC7FuLJkMVZQ7bzH64XSFt8A/NaNjxezx3GZKaj/BQSf7EPMEKHrpejm++UgGxG3vL+S
	 z1lQziJ4HtcxrjADa86Z3uk+s0T8//PzQ1HSElXPH/bt938Y6A73kONsuyOAleNueHKJk
	 oEzqZRoNgavzwkjvRmSJPrqGKghNva9xzgjtDECXhcSOtplXXKWl5iwqR7qCKHnglv+S5
	 OZO3H3f7IClDs8NQy5B0+ws3KeuE79zt/s3ZX0wIyu8+MhmDevIcUXtjNRn5vbYaMPUN/
	 YSOaaRAVgqL28Z9OV7uE9b/eyis2yCzq7IQ7ez/IuGACYhNAmRmhWF23A7diHbDVbxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IM+hFKlI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/X/Qkpg";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F54D1F000E9
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 08:39:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IM+hFKlI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/X/Qkpg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2F54D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7Dvih2115242
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 08:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/jOrd3DRqifk/50rwMGbDV
	SiDekpN+KoEvMP360iuSc=; b=IM+hFKlIext0eoVfZpfKaVZ1w2lDVB3VGD0FBa
	MYgCdibnSv5frLjdIxqqlXdgDhIX2XwExMB3eTjPGwEW0k/IiVvZBTVscfqx7pbr
	fY9PI+qtIfxxtFBinKwB7Y2Y16+ecz/nlXubGw1Jbp/CWEBGmhy0iwkrav1S4H6x
	GAS9psBjUMWqHdT6G7NK/nulSpcW94FJACn5doq7vN8FebX1RPjsv3+RJn+SZ26P
	MynGGdnezvB8HRFbuWVmBX47xmXUiE/nvqqMrxTpL1+wAGPmRxco7fnBgqWJ2p/o
	RpnQ8lyi/hEXeu3kYK/jj6vdzmXWRi8tDEmwLgYbXpqkEldg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1jv8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 08:39:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso3038519a12.3
        for <linux-firmware@kernel.org>; Thu, 16 Jul 2026 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784191148; x=1784795948; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/jOrd3DRqifk/50rwMGbDVSiDekpN+KoEvMP360iuSc=;
        b=g/X/QkpgMtWSxPPMZMPscDNZnHASo49ByrFduAu3YLzpu9tgr0HTmJhvZvAxc0dtHI
         6mZZ0rQyQYeZLPtEV82k5JswT+2AtIpj17rugToQNdFygQT8j/meN3ZMYQBGv5aBO1zX
         wXdZo2A4c71f5jmhPX5TI+om6V9d5POM0TqbuBsDqRaN7v1BWC0tMqlPxiovaTbPRxf2
         siNChduMY9WQRPx1rR3gXmNdVtONFUxCkgumK5PWKdcoc/ea4CdV2MDGLA/e/WBOf6ye
         jC4r2p3TyEHp0n3KQXZvECOXaYatliIJu2H9ZJ1yKVKob6el0l+/yeqgYiYKmVhJJkyF
         hmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191148; x=1784795948;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jOrd3DRqifk/50rwMGbDVSiDekpN+KoEvMP360iuSc=;
        b=U/5MaRErgQygHNU+asp7NQ9sv05Zpo8de/Knb+u35Tj056Vz/AWY7o7S8NXxLgn8oG
         wOqi1ZyNgTVRQmchCOHyBIh/Q3k96jTOjdEoqZKbBpbVvoJlpSzC3yFigbQOCxoe00Df
         EnwU43SAJCZEXF6d23QsxMw7PAKDrze07FIV3aP07lTfFoDNFzD1v/KT6EmcDp2QwsrZ
         urQjK4q7SvNHTSq188dH7L9QIM7zMYeF+LBE3Eo31l31/tA13E98klbtYbWhpq3ds56q
         3+zbPMBv7a2xLqp+0LyfTGtk69CqwSX7R5aNNibj7MTQ4m6uqASr8JT8zBB+Tg5D1Tas
         GVcg==
X-Gm-Message-State: AOJu0YxUWNXS6lHOZHmGdD4GztPLPylTGWKU1QfjetYvKNs1ntFXi7tk
	R7SwKzGjKmCVjakl6gams7iy6Hr/d6VirNT8M5w4dVvNa4BxDlx3eufgHpcwhQyZbwGWS/dsVAo
	qK8r5Wdj8Pi5jusiovD1qBVdBlCQtQhytyIUYxUijywojR2axv0AV5aCqDbWTO6/9TX6Kdkk=
X-Gm-Gg: AfdE7clZPUCPP4KUwGvV2t7babxG6yxrTtcFvQ3RygNaGEWBdV39fBn/lgCCJuZDfss
	eAPPriNSFr6Qb9qAppZHJ7I3bbHESTBAmWbHKT7hxUhzHZT6cN+tXOtzypoSk0UQ2ULfYJo8GKF
	3ZdZa7A5a43QdHDUnTs4OsHIox012qc4Vgbv4bbWXNt4MYoskSPye4DMmCvr+tS1aHHMdwujgZg
	lOhGBWeLlLBTkChUjhQ7ieI5lgOcONz72Mpw/R0zvFTzVh+EEfVFZ+DCNkIr2Rjs5Xn8mtUkjnP
	aK4wXZ045YD41JYh4kth9VD36y+AYZkMW50q1B7U5FuNs5z75NIeMFGOT9JIHPoxzrJ4HlsVo4K
	vWRlLGRbUYREgtNwueHLCLtvkq9lQtQ==
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr21996482637.74.1784191148117;
        Thu, 16 Jul 2026 01:39:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:1798:b0:3c0:9c1a:8952 with SMTP id adf61e73a8af0-3c110b35019mr21996458637.74.1784191147535;
        Thu, 16 Jul 2026 01:39:07 -0700 (PDT)
Received: from [10.204.86.193] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c2b17sm13918875eec.25.2026.07.16.01.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:39:07 -0700 (PDT)
Message-ID: <7cb3f791-1a97-4698-ac7a-7f4e2fbbb826@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:09:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for hawi platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4OCBTYWx0ZWRfX12mKicBs7tWv
 Eywx16akwh9mwJdUfHC+vH+l2pNZW/2MOGAVT5CXyNGI/r58c2LupOOnC2Zu8oPi9A0RHKCcrK1
 VC7sYAG9fGPzxyThMo4/WFXC2WUsSYhGKezDI1UxT7aiwgX0NaUC9EQjRjd1NxaK1bPQFX8gWCl
 Ky3WozLDSEjuEMQshyt3SkPW9CRAL22Jaew2coYrfIH1k3a8t6HojXbBf1dD8kVu77qoufGEhI2
 9d+TL8eBC/J9XRlrIj4aX8FJU7TGMmoj8265weKfHO6zB08fjEou2L+WFKKGrmtT/PBo6wJhuQd
 dL/CO41Me39jMNdmdJLiVztz02MVkNUlM4vwx7mu2ZdGWBItcdtaBJZ+zRlr6/vdRKylR1r+gUk
 bdzn/6RUbcs0W1cydRNBEx+C5d/OfOZrZgIDp4lr/8QlgpEAOdPSEO1DsufGNYMu1u75bnGHiKz
 HYgOP7KFH9qJ6xFHDgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4OCBTYWx0ZWRfX41A+lfSteGU/
 4H+XeZi2tYATnPZNzmNuxbhxjaiRef0NHOmCy9+54gr33tnsftQeWj0AEWJWMYbY92c2NflCodo
 RBVcYyurnAvK4G+LaUBmnD4sAzBFLBY=
X-Proofpoint-GUID: UglpRaA8IbTJuqDWrKItgMPe2dNQ3M9J
X-Proofpoint-ORIG-GUID: UglpRaA8IbTJuqDWrKItgMPe2dNQ3M9J
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a5898ad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=XZEZ4T9Ehcc5s4ppx2EA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160088

The following changes since commit 85336dd8506867f700b52ba8ae98b84c809eb351:

   Merge branch 'powervr-2026-07-13' into 'main' (2026-07-15 13:19:44 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-hawi

for you to fetch changes up to 9bc90ae3a3f0cd75bfa6dff97bc17ef1463fbf61:

   qcom: add ADSP firmware for hawi platform (2026-07-16 14:04:32 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add ADSP firmware for hawi platform

  WHENCE                 |   7 +++++++
  qcom/hawi/adsp.mbn     | Bin 0 -> 17086728 bytes
  qcom/hawi/adsp_dtb.mbn | Bin 0 -> 180040 bytes
  qcom/hawi/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/hawi/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/hawi/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/hawi/adspuo.jsn   |  22 ++++++++++++++++++++++
  7 files changed, 102 insertions(+)
  create mode 100644 qcom/hawi/adsp.mbn
  create mode 100644 qcom/hawi/adsp_dtb.mbn
  create mode 100644 qcom/hawi/adspr.jsn
  create mode 100644 qcom/hawi/adsps.jsn
  create mode 100644 qcom/hawi/adspua.jsn
  create mode 100644 qcom/hawi/adspuo.jsn
