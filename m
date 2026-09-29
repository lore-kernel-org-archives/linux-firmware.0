Return-Path: <SRS0=mZhp=HV=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632E6C9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 05:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F2EE1F00893; Tue, 29 Sep 2026 05:56:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790661378;
	b=a4bDKNfZgVtSVjSgIDHBFxo227F7UsWys07T/M/l/ife11hCm0vcCcYEoLNY+10URM90
	 mKiWElDSis8zl5mS2wJRWKZf/3BL5ZsUGqv5eLK+3GTjNRgk6meMB7olxY8/FrC45Ziiq
	 +Fyv2WEK2GgyJ+W17AfEhOOhqRcRz/M9xzSt+XMqQRUDLZxjlBSX0SSZMLXfU5l8Yr4+c
	 2Zv0MQ5oK3kUc4I3yDVfon/HymepUUSfjSO8+ycHp18ALiSzVKs3nk1z6IhRYAcS9yuqJ
	 icl+PkOSQBJ6uk7zNEKszVikNIPvuZGtGuWF/5Tit7t3gDo4nUiCnIYxYuWyPl7ThPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790661378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tfi0VEMPiqjbIVhUB6Fu0341LjhKrYgsu4kK4KXQrWI=;
	b=DkvvHu8TtVK6PHgTFSE5G9u+1yAD/6jVdSVQRgehVLC3UKWa+ykfWduNkLayTklpCSXY
	 u5nnFJz8nfuoYRiMObRm1lxX2fGQvZG1D7ufFobJOY7looPPddPJXStHECGII24XvnHGQ
	 l+UN9lhT5fIFruThlgfinWbefGhV6rdutQPLY7pycfONrgUD81uQSninGkk/nNWVQzWVK
	 Mcgpq1UCnMqshZkAfBtmT18VBSUWBIT7mZfp1QR0xVz6ZxXk4iAqhAhNFRnMtQpbD+AmZ
	 FLxU9I3vcnExyBP8AM6WOj3xzk+BR8xLs2ISr1Y5h5bLNMB8X+fEegVq753FJAkxpIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NVfY7/5b";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I54cboWd;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA3861F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 05:56:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVfY7/5b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I54cboWd
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AA3861F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T479w83643011
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 05:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tfi0VEMPiqjbIVhUB6Fu03
	41LjhKrYgsu4kK4KXQrWI=; b=NVfY7/5bsLKB6peAZIM4Ooq9k9poL0ydIMw4Gk
	GWOKH0SoSPDLmEMSN9TchMZtooEcDK6TLWgLnRF72sXp3H5AOQxUdfi2z4ROm0Va
	E+6Pp6NwewyzzoUuIh9QvSErZHrfKcHX51BSMsrmsKgCxndQRv+/D/G25rKTpacR
	nwwepTb47TdOkp1NB+BeprOK+qIKqsiYfRWaYAgiObOP/nv8WilVVQziK3cBBHlJ
	2lwYME89XeiWzRwamiBHcDIRK8y1rEshV+L2n+WR7cl58+fmvAXANJUifk+iikaH
	vDN7JsEh/SZFrQKBwZZFGZHr9N8aeIkUzOIQLnN+Y/ApBmjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4sdqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 05:56:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so1655753a91.2
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661376; x=1791266176; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tfi0VEMPiqjbIVhUB6Fu0341LjhKrYgsu4kK4KXQrWI=;
        b=I54cboWdsHAR40lMGNmTXFn8UG8aqGJAik8si4XbL9gaq/vKcPCL2lnk3UYaQYX2tV
         Zy/DRbomt3VgCCLjfa1kOcbBXOFE9p4GPl8CeD4m5nnJ4PTO8RJIiiWp84qHVkYP9AQx
         S6I5AqrU5fvY0GxqxiWQfGQU3mdv7uRhK7S2vWaWFmXtF/T0m8XFwcsPsEG2V3KOfrig
         kY3kaQBID1Xu4kUHwHghaaL/NmlUlz7Vsq9Y+/G/iEzm+hfA4yNcEFnRgaU7oWi7n8z8
         gDGKQoa4e1ZuVQoqfwwJb6SFpHXvRJ2hnBsgku/ll5y5pz5nMW5ttwwbAsnkZeaEln0X
         HKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661376; x=1791266176;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfi0VEMPiqjbIVhUB6Fu0341LjhKrYgsu4kK4KXQrWI=;
        b=Y7PSFd3qz0KPbmGCJyHsqNw2Q8Ru8tcHs8s0LAt20q8BPLEkfwxM404q/bYWOpCiY9
         LHQcP/hMY0R2TeDuZ5fRox7vl2HmG366Xc9v1H/8qvy7oSPQdnIRnmSZ+wIS1DWd0jBR
         /8mh9yOhZFjUcclmcxjFL7eE/g+UtuLZMawkgFmWZenH0LfCthillMoy7pY3vIakM7vQ
         DJ/YHklPMixA9J2BaIgd13Hfr3KS7zquKyufW/lg9qNiKEp9A6HrchEO1KamGiZjpkKg
         1Y6G1qSOAyGaZvIzf0fe4XfNvd1wBu1+EMhfX5Xix4zd/gu4B1UvrloGwpanK3TEPi7K
         DK4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpMgrgy0jhsjI11b6JBGHsNKX4p4f1PRRPOYwe6HdE8LFmXIB8KhZtFbdQPxEblXNxAMETCagFLaGd4LSbSA==@kernel.org
X-Gm-Message-State: AFq9FYL43H3tJpRrDhGWcRF+mPywFW5T/xtAGtCvgLJkp4l2keYGqgPZ
	4ZRA57PNdF8NqbRv/PS8TKQQTAEPW5TL1JGIS7gThlVHmpSmnzfeG7kE8EQ5eUF7iJ6a6tghplA
	1wpL1Qzp2sz8YA/KDl9pPK0Imp3IgD78keaftMKfdNdB5YSDctV93fAdhyFfBkXc=
X-Gm-Gg: AYBFou0LIyiWCMQcbe3qqV4/0vOZru6kvB3Mqdjp/Gl3ScE7O/XjBGNBrRuoacFHtT0
	T1F8xePyiSskomp6AwMC7rtXaOpWzNzNLjxiT79H1BXjGqOQrAAkyehzg3Qlvd1cDzIqe6rgffe
	22r6gFh3KhjnDAoHAIPCwV8uueQ57ESdWe4IIPd2m+reGCeNel9xI79fXLRaji6C25iwi5Wdstl
	z8QzPTOXww1hm/1AL3kSZWbbhnXKAC4+4G6Of4uTGRC1H2ZIII4SKr0ho9MoK9LPGDy6iGZWzli
	OFOQtsQuGY3pxyEVjUB04sNNgW2JgVSsm73exv/OJ+x+Xl2RwVxVhs7Z3as5+x5PP+C1BlzVyk/
	pIV/yckFPotr5E8iL4/dx8EGobkX8
X-Received: by 2002:a17:90b:5847:b0:3a0:b40d:827 with SMTP id 98e67ed59e1d1-3a0b40d1ebamr9043521a91.0.1790661375979;
        Mon, 28 Sep 2026 22:56:15 -0700 (PDT)
X-Received: by 2002:a17:90b:5847:b0:3a0:b40d:827 with SMTP id 98e67ed59e1d1-3a0b40d1ebamr9043506a91.0.1790661375323;
        Mon, 28 Sep 2026 22:56:15 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986e9656sm1162089a91.0.2026.09.28.22.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 22:56:14 -0700 (PDT)
Message-ID: <5a6164e1-a66b-4b39-aa59-9c2c5fb824d1@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:26:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for hawi platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXwQHT/yIb9JKB
 loOSj2iJnM9ddXGDLQYsKOGRAGYcYPnZBXfI5gYtUMRDj8Gr8NEEENW3T4KPnLC0o/T13Sff3s+
 35vTZvXHLVNQQ4ud/33i6HOnQ3zHNa4=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb5300 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=_auUsURdXUbBIUx3I6IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXxU+fNZaDkqeR
 NvP56ruNEY56OvaNgqj51uuCA4xf+MTqeBYSfkKBt9iLP4FDP1kt+eASXloBhshrQ8r+aGtrxMZ
 aluvemSDzPmFCyBxYGj+HpDsYFc2B19yjke2RQY65okWfTmYsuEZuNwDlfU+9uu6wnx5vJEmN8L
 GUYyq2GCgKInLlOEDji3HvvSI3uDbwNlsIX6xqCX5yFAHVMz0lx0uPhVOqqQMMSyOSMAhxwP136
 ynnTBbMbjEa8zd4cOziS1HRC1NDczXIUjgWhsoioNl0b4313aKkbJtc1/AjS9zo/QJoexjJLN/H
 2cgCDURdimM2AsBYWL8J+a66uBY0wG6UpgAOIhulr+wg7Ow04iuBNi0EoZBN2oRCwIyKhbE1qf8
 o+YRR7VsOo12fOmZB6galsKcZZQ0BpmvemFpkHXlDmwbKsF2PVYO3lg5/ZPVvffv10I+i68KO2O
 EoU24FAMWOM9izVW7gg==
X-Proofpoint-GUID: xsL5yuqoj5A4l0opF7uB8_b2Q74aHRq9
X-Proofpoint-ORIG-GUID: xsL5yuqoj5A4l0opF7uB8_b2Q74aHRq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:

   Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hawiadsp704

for you to fetch changes up to e13358126f692a768b8bed0a188a1933ccac4832:

   qcom: update ADSP firmware for hawi platform (2026-09-29 11:24:12 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for hawi platform

  WHENCE                 |   2 +-
  qcom/hawi/adsp.mbn     | Bin 17086728 -> 17086728 bytes
  qcom/hawi/adsp_dtb.mbn | Bin 180040 -> 180040 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
