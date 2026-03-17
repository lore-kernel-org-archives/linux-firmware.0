Return-Path: <SRS0=fofI=BR=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC513FD708D
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Mar 2026 20:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B550BC2BCB0; Tue, 17 Mar 2026 20:19:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B40AEC2BC9E
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 20:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B40AEC2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJj572294192
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 20:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h8hJpBSymWCOuiDE63BWom
	IOUCJqxU/ANvolJAkwQik=; b=EdJCwjRks+tHuwFj0x7YLeaFL6s704BL1NLgXi
	+zK2X75joPTXfmrSjaOwuTBQWpxBlapLQePhZqqRSRQV9olta15fMpxCzmi7s1Bi
	dbGJbbDP2RHQMbgmFRaatm3ruLLoW/Qtsjn7OGSAgKW5AbP++sLyvOfNpQ3jvrQH
	qGwp9s+cv6a62MjGuO/I+hCvY+lDg4pS2NSQR2OSK/OkTO0GuU1Jd+YcIfShqZX5
	t/ZVOr012PQVgQuqFUR+gN7fjdT+mcBAbqTFDWgjUeqI94PPJXcEpOmHRGFRzm7z
	zyfCv3tY/pfncaikXWIQAWWMmQ8NUN6V/d6TMKHmaxAoVI8g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83rw5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 20:19:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2beabdd96f2so5780662eec.1
        for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773778741; x=1774383541; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=b8qNa/bMi3A4u13oD8sEZoUj27U4uiqvdRPI3EIB03U4qkg6Ij1YeZXtp4e7W7fhLY
         R5yAhoSS1kM8rQtIayi/WhuXiabGtnk/B/KLHSxccg+4sV0rZbJJ+rySNPqA0q5JigOZ
         aqECOojg36+T5l/pMM8r2vqhvuaeEimUJq7A8um20Q4O97IyISWLNqBjYgkLJ5yVaIlP
         jTFTrUJhFeN8P4YgQhrdk5E5SE90imDdxJaDhk4Mg3agqYDIQ1E8l0ramQLu9BsEoG+B
         ZE3W1r9WVrzhlI8wi18VQeq/wZXYv5F6csgpbmjjU2jvLjHxGsi892SQsG+2vXnY67OX
         Eo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778741; x=1774383541;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=dVQnSU7FzDK0eiI9Vdymue7Z53HGVpSyQXnmm7zBDPHxV6KeqHrUWEBhHyTgiAo5Z+
         dcolLvO+8R77ljEnPTaI3ylq9cks3tH7cHcUPUajTIaEbz5TNSrGWsq1cDo8LiJdpviT
         wqK/9T+QbZ0adp7FAbLxCEPKOppRt32opAt9AYG6d6XX7VXlB9f4UQ7DPCjXadjiEwIT
         ntQvDe/oRah6LmOX6wUJJnxY3BdTP4hitcMHLq4OpCo3MSDlvxHsXLCvpEhOMMAXkLmr
         +gtITEVpxZ0+xJTbAG4dhcapgvIyMQfnkGVw0hAcVTL3cNtDDuMlAmqEytyGWWJ7ni8H
         Ct6g==
X-Gm-Message-State: AOJu0YwDJMFf38U38taLHiO7MpbBZz4WusqXzkVt3+ik8Kfv5n6eWh8V
	gdjpGi45kiFf6zQK+py6fkGM1tPq4l21+BjxoALid8mxk9R20ZJHY7zM+4/BSeqrwteb1lbjyjR
	IcikJbDk/HwycveVRk+ps7gfUI31Qey3FZOk/wqo3QpPqY5u3shWUKwMZRGHTxlqry54mYFM=
X-Gm-Gg: ATEYQzxdx8iR/YSByYHprclSPF0D+nnhGm6ldgDd9ogFn7iUDVP3SrsmTDBlLgB99Qk
	4CqtKL5E270Irv6/qXjQP7BnNHipVbDhww2x+lHxoL72nFds+CGhoWRTWnMpbKGy/4k0ypldav7
	amGRIS47xDUQMbM/Ai9k7fTqN8p1a6DLf8YIs7LrDWmfwyKYtnPoEhko+Yjnxk+2Ez/iRrz0HQ/
	U3DJwirmvhAwuIvkIm8TQGze7lNjrCZZ5G9FYrpvAC/59MhYgXJVcHLjk9XasuixGktj2cG3PyX
	r8hKjBjcXqPz6x0tAITBQREW8F6/dCvRp0wUftx5wP/2yAeuODuIRsv5CEQ/lW1wvCYLRCtiSN6
	IBXvUUplUlWrS2ZpcNQuEA0UHQxnw6yD5wp3ieCihuRR1o0JbLbPGtHMnXA==
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393494eec.10.1773778741095;
        Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393474eec.10.1773778740510;
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm756534eec.30.2026.03.17.13.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Message-ID: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260317
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jMP401vETdoPY6Q1N1Txwv-kQCC-t0eI
X-Proofpoint-GUID: jMP401vETdoPY6Q1N1Txwv-kQCC-t0eI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3OSBTYWx0ZWRfX5IRRcmIIUegk
 AYH7SOJsUNDnh1vCtMFBHGCmwfSHPNyue4ZCuMFIIXp6yW/0lU1HhQ90OfxMh9DUv1RNgkHDvdP
 0x6/bvFG26ZGrqNv2xMinBZbZIHopswRskF1zlL/Qs5c0yv3fPrWIuGtm80h/cqyMVGbWHeV+P1
 xtpqjLrdS7NQ5wf2j02VyeN5/qbDaBXpP4fFINtq5iUAh4aSzXmJCV63Yf8kl9tvUOe0Akq0mu8
 jenGVCfkaLxHdo4ULqs9KutrUV2Z0zzUJ4gNqWSBpjrxyptYj1NYfwfhB4krDB+QC4xg7BP46sr
 zDgHn0ShasGzz6GHL7O6p0ITYiGJhu2MY8sZPF24O7o07W+c3CxqCQYSMty+9E9KuxiW+/TeJPC
 t5MpL85vGRwOz/CKYeDIu3csLRtIWuGLQ7ShkfoCsIKn3ZML2f1DwP13Bz0O2tCa2B6GfYGpVuC
 Jf++aZYvhL9doIKegBg==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69b9b736 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=lm4jLvrnElEPTkshbfUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170179

The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:

  Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317

for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath11k

For ath12k:
Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
and Automotive.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
 ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)
