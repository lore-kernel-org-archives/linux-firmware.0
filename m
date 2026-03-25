Return-Path: <SRS0=zynL=BZ=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FD4109C04D
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Mar 2026 18:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26FB6C19423; Wed, 25 Mar 2026 18:00:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D210C4CEF7
	for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 18:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D210C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRLth1432159
	for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 18:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M2igQvo0xuhoDdesLA15tF
	kb4vPga0Hsxbg78nCkoEo=; b=Qbv5X0HbVUZz+vewgHuF9ZN8NA/EpeX/qykEMP
	nf07y7SUKqHGQKCiXfclA2j2MIo4SNlLok57ay7OwRmTa+XB1p2oXh2WyKnpSVxp
	bGvAl9kYl2Ou+U/BgZEk5ZZ0160XEAa2bGL7vsXHEwsV6fCe5v88flhlnUD/1Urt
	qE4cI270bk9H1lPbYuasIVtfS1HdcrT/0wYAWOYpfoP+qrZou3p+h5Q8+oPDHL4l
	syoCRgv0x9FxzyQ/tod31mWf0iwn8CY9XlzQ+cV+YFO4Kauc5wmPFwgl/Lw52aY2
	gcN5eoyfgU6Q4sKA1hXGuijWiQPcwe986ydsQQzr1w3TgdpQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc50kpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 18:00:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0ba59a830so171123eec.0
        for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774461607; x=1775066407; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=cqhG0g8OFp5z9QkUNPdUsDcRnUBwzfyWJmbasoEy6o2OA++xxfASovy+zSHZqRoxkx
         UWu0I1SAK0jmIprSe3ZRdaHtXNXjVEQPZSRiMVykMq6MK+V6Ubmffqyg4z5V7t11zTHg
         IuCUZcTGOIZNU5A4ZgJcqg2Y1+NsvRyOuzTpNJl19t5bd0+6brpTnfLNkNVSzTzIfKfP
         u0KMcXi6hUxPuqPy1WDqdzYCHOixC7hM1efjk70uNtW72KdUY2PBiSsvIoImHMukv6fG
         DODBgsU0FOGJqn8lj/rV21gv8Kp5iInkIoqSdRIQjnvXu5Z15AOnOwIDhcVC9AUhYlD+
         +HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461607; x=1775066407;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=iswfmGtRYnNM4Vgzb3XNw3sn0iAG7s4ijHXlHdl7005bwJHtXfG8OsKpU0VmdvL4sj
         gOtai2gqqWkuYt8E+50FCVxSEI1w3bGu5skpgxXnkDBPc4O5W1nB3s5j0nouwGtIy+N7
         mRf7l6rF3Nh6F3vFgaC2jtls5PUvA6jcP2X8pZlG0X9rC8OAtRWh9zUKF58zfB8vt7j6
         dVeNPcDQ0JrUFipL1E8wQPT8dJA2sa0nUbM9Y+fV6bfRzdATVl2R3qIMW1Ib0hop0q6q
         JjI4zjo5kE34LqWJbEdSIJVNKue01ExlgD09efZ2Vkitlb7Kq/rnM2uYbM6ydis9MzVv
         NUyA==
X-Gm-Message-State: AOJu0Yw+ZCTFwMvnh5yYRkPjsCrXpW2S6jwrx+rKKSlNmXGjVp3yrAgt
	FYqRhOPyk2WOs8wzQWYKAFzCM39agX/YmAZmyt5YHdR02yu+QgN6wsDjF/H7/nUthIAyyErNUEy
	euppBcBTlL0XDX9lPNHp6+Cx73HHTuya2/XugKg+QTUTqdojBfWlVP911DjJMn5BIqAIUjDU=
X-Gm-Gg: ATEYQzzMJf4ZmHZZwtcm5kQ0ZSBGoA1G0ov9+bFCwAhfM4d+o4D9QVz3u8MMveEy6+N
	eDApuXgiKRiyG6Ug3NYg/8O+1d8d1+bJF8WcddHT5w0ichmbUjAWhABQLDxe+ZkURIh7srgs6Ls
	vLyBa+s0csjRc4jDgzH07ur5TkBHShcwRNTGak1vJCK20kYPUKV4xjIvYrOlCmSH4jGoOjSdbes
	Rg3ng4knQLSykANyNL9Leuq2v4KhXUr4W0AwKRXUtmV4ghRb9+s0w4WP/JOa/p+QxcrylsPLkKs
	1DiDTK6GtgSrFRNFUdqtwV3MVdPX4kmSfoz+IrsrLalbdUebBUPpdbPBG2sB4qUcDSSr3OS2t1r
	Q3XZX7QoCKmQLOgqDJkKOph9ofC4Fm+ZfqPZeUaymEIpdU3dqmHhDM/3PBw==
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650443eec.16.1774461606777;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650432eec.16.1774461606183;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec2690bsm428056eec.5.2026.03.25.11.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:00:05 -0700 (PDT)
Message-ID: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260325
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fioYuIS774YKV6wXZllclY_2FXl_2thO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzMCBTYWx0ZWRfX8Ji+8lsJdzsi
 9TSA6+nEtatv1tSyHc8z6BrgRzPE+EKaSnwbRdX1GAAu30uf/IL24ILmgy+IR8zY98cQMsNorET
 X5yfZ57LkAzLnWyeydK0XB0lNDnyMDchcbCEcLych5NRJB21wf7DDFXs/SxG8/9D632HX5WhayG
 PSOCeKWz7sOllF/3j2f0x65wcfLBMZpsSW+r3LT5Bi2IBd/SmTGnjQCY+AZ57hoNUo7dnpUfrcQ
 gpDUoT4aa1xDstzfD2fcCPt+njgNjXgoZCyNRWxx46hPC9pCZb3c8tOhDS3cE2QuIvtM1X2LVQ6
 2ogdad9DmcTMeSCXNNGkpK/57g3rhrJrKlQKCOnGT8vxg+nmvo6eYz7BLbAdR+TCBhg82pPHHs/
 Ce9rpe+7B5iNslCOVZnGq5ZluK5hyf5v8Y7YflT43Lq90Ie5YBLP7twyzjhqbeF7VunBP7LOdB8
 udcsyFYPNzNjaArXo3A==
X-Proofpoint-ORIG-GUID: fioYuIS774YKV6wXZllclY_2FXl_2thO
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c422a7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=6dYnDcIryfdnK3l1ooUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250130

The following changes since commit 51d2775ba036b0dfbfe44c7ba0a1350ddaefc058:

  Merge branch 'qat_4xxx' into 'main' (2026-03-23 21:17:08 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260325

for you to fetch changes up to b56c03b621391558627e3aafe5a8dc32d3997680:

  ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2026-03-25 10:53:18 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath12k

For ath11k:
Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                               |   4 ++--
 ath11k/QCA6698AQ/hw2.1/amss.bin      | Bin 5083136 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/amss.bin | Bin 5005312 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/m3.bin   | Bin 266684 -> 266684 bytes
 4 files changed, 2 insertions(+), 2 deletions(-)
