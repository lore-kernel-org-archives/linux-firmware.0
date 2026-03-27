Return-Path: <SRS0=43lV=B3=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9F410BA429
	for <linux-firmware@archiver.kernel.org>; Fri, 27 Mar 2026 04:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 027D7C19423; Fri, 27 Mar 2026 04:56:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD1D9C2BC9E
	for <linux-firmware@kernel.org>; Fri, 27 Mar 2026 04:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD1D9C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJuKYM3075369
	for <linux-firmware@kernel.org>; Fri, 27 Mar 2026 04:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=alE3AH8D4hODOSHZIxDq0H
	vAGYOjv/X886nuLWsKwIw=; b=pxEOQ6X67rPlUx0wu/1Cu0C7//CeOj+X7Z2MvC
	ghX/Gf9S9CnF0+pe5GsGqqboXu6LvdYxC3okpiYRd6F1v1y8h7DVPQANHXaInq9Q
	9ZIKz87GojHSfBfBQAy+6mlrKjairXQpQwqZ9hT9MRCjaf5UtbohoIbR3L/TSTXU
	QQkWFIK5iYStwdQaaiBAkKFCAhIcm0Ljb7bH/mXX016vcYFDEBSXhOwX05Nauwjq
	XCiV91ugY/O7Pj3Xj7MVcn902UbeMe/0qdKgYr54MObc+BauSbM5QTXPDbdgt1UF
	Id2eBMLs3TnP1Ct8lYCoknTr/cDiffhVU+O0UoujriQ0nJdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8sgxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 27 Mar 2026 04:56:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso4616531a91.3
        for <linux-firmware@kernel.org>; Thu, 26 Mar 2026 21:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774587384; x=1775192184; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alE3AH8D4hODOSHZIxDq0HvAGYOjv/X886nuLWsKwIw=;
        b=F3xLH8lnm+2OTaQG9HjHlFy+WaKTQYlRMxWhkubrWfS598C/qBlByZzGXvVAsI1lFH
         aX16LcfSrAlejOpTEa+WriUPMrYzyRwyZLBaXFKlBXgzGKRqoLFQXo44s1edM5MpGwEf
         kK1DC8DG8/9YM56SFyh8vr+9GNgfomUuDrxDsseNbVahbA0AK6dx5Shqyzvsg6TVhBFj
         bLaFBfmIaFNRmZLfUrdM34KQO7P0qYAwR6CMyLKR0MYCcfZKBOBw9nsHTuzCKpvBTaU6
         sjVK2+D59iUtGwiUxq2prDhYpUlN8IxhBFVU5mdWjO6DH7uFFpgD0L1bP4ZrjTxuxhRh
         oa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774587384; x=1775192184;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alE3AH8D4hODOSHZIxDq0HvAGYOjv/X886nuLWsKwIw=;
        b=SLElM/XsRdpKRLOSZc1CtkAVFZp03cB7aq7lxS2UFTB7fpXCd0e08gGrE9eBrwg5+U
         x5XAaIY4uvoGc58vHTW0NiKmaxJIFKLwXP1P6ipU0xfYl1mYuL3Aq25BVG1i3j2PLMp0
         +4WjXYrLObeMWu9NUc+WO3n2YTNkDeNslT2ihPAJS0eonfXHvAmQl6exDQUrBNFNaBUM
         /1Lr/nrh03iRhX890vbGngb06kkL/E9JIOUTafPc8nP/dE14fmfV2LpPRFNHr76rh1H+
         cLlKqENLN3Wu60ihFXvIBEl/i7mYlAuCz3TfTHEb8P0DAy64U6br0aMfZVbfKaT9sd2G
         FF/w==
X-Gm-Message-State: AOJu0Yxw270eYzqLwmAfj7LoICcgu/KebrWMrjZ+0GRDPMNCbYuPQEPS
	+ZPmXMXuyjUVinp3hvOHXdQwFvg9v0pD9E2tEc88StJ9sbG7ZK9CRw2Tpr4cYaq/0+/ciLo/RM4
	1sNC8bdGS94VQbxYh31j7EaNgfshkpxJDWsZIOTox8ItGwmz7On0OIxAbq30fTpx4GPGlSzY=
X-Gm-Gg: ATEYQzy1Ox2Ess/+vIVQl3EDcI83SYs49Pnwx2MjScz6Jvauj6vqzV4062Exn4LWBMC
	Ru2JKdjMskyoOwZu9pOqimAI+Ob35vlQ5SRhZ/w++G6479QCP7X0+VdTCgTwV9y2WItI1iLnenM
	7UoJknU0cn1M8nvOTvMcQvxP5s7nI7aCSztC+YzaYVCSVwBaiF8bzlZhhOvHtjSR8i4d0n2eSDX
	e8vuJURuijSoiZBPoxtEAYGo+mq2q9KJ0xbXtG7+IXLIiemzKMhXj5B7IHgaizBccP54FBhDQ05
	w9VBSv4Jl6svNNnkf8ZgezOu+O2c/bjMXGAKQw2AZ3dGMbNxhxX+jO/58d0EnNnSa1Hpm+4Sz73
	MwVtEHNkqFudoKqamzchAJbOH4jY9gFVzSMtT4AqDJ9ZtgFy2OCCWEw==
X-Received: by 2002:a17:90b:48d2:b0:358:f0d0:1a19 with SMTP id 98e67ed59e1d1-35c2ffffaa2mr1287789a91.12.1774587384462;
        Thu, 26 Mar 2026 21:56:24 -0700 (PDT)
X-Received: by 2002:a17:90b:48d2:b0:358:f0d0:1a19 with SMTP id 98e67ed59e1d1-35c2ffffaa2mr1287771a91.12.1774587384001;
        Thu, 26 Mar 2026 21:56:24 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d7b96f3sm506026a91.0.2026.03.26.21.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 21:56:23 -0700 (PDT)
Message-ID: <94396d37-1f41-6dda-1527-32818bfbec54@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:26:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: add video firmware for SM8450
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAzNSBTYWx0ZWRfX4yiUfyCH1/44
 shy3u4gCt2DcMnZtMnM4Y2io9fFCOlkE913NpXoFX2aa7Z6SkAMYdQrrSffOIdelFDMLabkH9FT
 gXE7wfLqRiPYF/8xxa+jUxAIjmNpMoa9KEeCnZbUr8J9IGXxAEjR2XI4zPcgBNMNdRkL1ZWUi68
 AqLviuXt+dFLEM3ZgTaamaOLgRHQJWBayehsUlubiJSgcf+VUBpbh8WBooh0j5yj1hZAmibcVAI
 smOXSwfrY3aELk5795DdJqFvDXSAAEwvJhO89ZcpwwTSJ7qIDzl6Uqqi/FFC1Ts80wIChlc2oYz
 6LixRA3S2FwRH7hMIoKIICH/J57+x8e6A7a0VHITHM+NPvMHEZPE/Yl0J1ybUSgROpGNB3dpRrN
 EONXCQKUejLjjIMeF6M92Pzvgp2H8wbnHwwVfFvmAzwvPKWYC927jgnTiS5iyXSwAHKctIf66bB
 n1vf1Kok1FCLG94Xw1g==
X-Proofpoint-ORIG-GUID: EKEAt-5XyepXQA_LZ68x7mmgOvBJ6Lr1
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c60df9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=vibV4y_dvT2Z6F6SYBMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: EKEAt-5XyepXQA_LZ68x7mmgOvBJ6Lr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270035

Hi,

The following changes since commit bd794dd407e226aeb6b773ce9cc5c57ca6380a36:

  Merge branch 'robot/pr-0-1774461765' into 'main' (2026-03-25 19:38:20 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-Sm8450

for you to fetch changes up to 398624cef56153f2fe9f4e6cb176e88460262bbc:

  qcom: vpu: add video firmware for SM8450 (2026-03-27 10:24:21 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add video firmware for SM8450

 WHENCE                          |   4 ++++
 qcom/vpu/vpu20_p4_sm8450_s7.mbn | Bin 0 -> 2024040 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu20_p4_sm8450_s7.mbn


Thanks,
Dikshita
