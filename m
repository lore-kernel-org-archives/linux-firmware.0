Return-Path: <SRS0=bFuW=AX=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C984E9A03B
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Feb 2026 05:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60732C116D0; Thu, 19 Feb 2026 05:39:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8ACB9C4CEF7
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 05:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8ACB9C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1F2MG160557
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 05:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/aW0XgXiZzmWQ0kATF23Wv
	amhkXz7hXcWCUOzyIniqQ=; b=UjaZATjgu6H/aI1FFjCxhsgRYqmwRZI2OYiVe0
	Bhj08cu6LsvTPIlP/0rGj3zyivpZ6JvLUqSkHQGMXk0MxeztFbK+yx3XlRfuIXjk
	uKMhxiNwSLvUpcfnvrVWmm6oXaW/41DT8dD6sVOkvur3QOylrW5YcokdNCBheA4g
	Wje9aqNlaC9Kb4tNB7DMq1IxcMDoFcYSkmuYUO4le47haNKvw4i7vfLjHWXVhVne
	bBJCO6VySFPSSCk73XnY2TvnEhz49VBgWP5VaNl2G1xffhh7G2oGWrxHj8z0DIKW
	bEHUImlKrYOiUI8PBisjf5LX4eEdeWHslBJN8m0r2emjeFEQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpg8eej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 05:39:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so1063921a12.0
        for <linux-firmware@kernel.org>; Wed, 18 Feb 2026 21:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771479573; x=1772084373; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aW0XgXiZzmWQ0kATF23WvamhkXz7hXcWCUOzyIniqQ=;
        b=QxBd8JJBqMuEud+JT84qPpY2wWMjpzkHumh/J6LT5t6Zi7bsAdeKCKc7qqD7X1qJpL
         npwcn++y6OHJJ5gZ3VtCRUQDiAP1+bGAlUgB+dlJ32i5KCg+gV2QVAxOiFS9bB6wTIZv
         bktZgDCwqVS/nEwftvHMSbxhnd/8wmEwK2BMf6DkrnHlkoGGTpyq9MnMn8VRhGzemrkD
         K7sgPRgVGiZ3ycGUgwgRidi4poaOwLUx4ZP6fszIZErCEk+/uR/+1RmM4dw6K1snyNI9
         pH+1sjvosg/JkQcOOursl9dtpvpP6qvJ9/7ossr+61+9STHSIF0ivdw2K/rt08hgXvUz
         1aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771479573; x=1772084373;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/aW0XgXiZzmWQ0kATF23WvamhkXz7hXcWCUOzyIniqQ=;
        b=M7vB7dR2uUS4B/m4rRkb4lWnrRQHcvmnwnZKtwNrj0qdNZzO/jSb2thtLWlGAKJgJT
         fa9LD6NUWAMkOS1na+omKtqs8fu7opK+fyVhL/wFURJeTNGXWcP2uPxxYxJRyOBcnx95
         DI/m6aH2L3qsOcFDkq2r1REuMtBj9S77O9dhqk8MlYwTXEwPewguDJGJneDxwyD+bOne
         axYJaBbCXdqEBBgLWjcNbE72Fm/SHU/MeEYCYGPGGIUMWtkpgi66U+UQNI44eylYg4KC
         syj5BfLJeNWvZkx51HKV0LmrVVjZY/N5iAV/q6iVZED3zM7p21ZGS+CWhpvkUuC+3Iyb
         yyvw==
X-Gm-Message-State: AOJu0Yw6FAhT29xP6FSBw27odGtbIKdXQ+ocF+4HWH0JKG3H3CkAjLlI
	NBWgRwd8ptS0tOTvvRElhg4MgGee9j9ZHT1OzDvsfdH6qk0/oqvP9C6SzBP7n7SzEOxdow4tHUc
	hUei+rvTKRlTWuHxRra55gJpkgTA/VlPoIgs3ntQGwqCZchtjfnxKOE9fQUU+KteeGaundag=
X-Gm-Gg: AZuq6aJeOMXy+osvFzDSmL+3qmqqp22vtxmHUYozC2NYR5L+R4I2vwB9D8UqLp9mVGm
	++qr40Jg8Lqq1Szg2O8JDdF2EpJzvNZfcf/0bshKyUeH75VA5uSctuf4ODN4HGz0OPUQs+mRgwb
	hYJfMaPSGYS9XzMibGuoX++QbmpfiaX78rPe6CNRf2yuCNP8SkofGadYYbMHnNKafvh8dhlzvpL
	4qBTwxG5Rt24oVrHs7Lqlql8phYL+kcjBT4LTWfdx86PdlBguadCzdCc3redB/kUr8lKyVn6prt
	askx7ORr6zklTqI46NdhJXnjymNv9TNJVm1V6tfsgoQLfehZwlmDW5csrGZ3KH5IDo2Af56y65c
	+DovWphXkFfz+0Lrb8JqIfnEmB3wilUOehxGWCXy3VWW+NciCZ/0=
X-Received: by 2002:a05:6a21:7704:b0:393:72cf:ec70 with SMTP id adf61e73a8af0-39517b30860mr790671637.7.1771479573374;
        Wed, 18 Feb 2026 21:39:33 -0800 (PST)
X-Received: by 2002:a05:6a21:7704:b0:393:72cf:ec70 with SMTP id adf61e73a8af0-39517b30860mr790654637.7.1771479572872;
        Wed, 18 Feb 2026 21:39:32 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331bbe2sm14736500a12.28.2026.02.18.21.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 21:39:32 -0800 (PST)
Message-ID: <fbc5562b-6b15-141f-0039-6c1a5931d555@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 11:09:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: Add video firmware Gen2 binary for SC7280
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dtn7rJjwbmHcwlQ-d81JEGtFWf3yk-Il
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=6996a216 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=vgTJ3uqYKia970mDUHNZug==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=WxhVxHL0yzRsc41AproA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA0OCBTYWx0ZWRfX2Gw5uPsF6C96
 dDg8GSxJF2fAAfqNDc0RaBhp5z9sX31ZdghJT8yOPn9nnEvoG3rg5T0KD0LnXE6l+t+OxdNvOeN
 8sapdmIW6xUIl37+oYbcScDyWnzjNAlMY7uYT+HfWjRAEn5Juu2KQW4pAq4rLNdQytOyc3koowk
 xM68eRBvRy2zi7+jiNP84h0Jg76VcBmzbPs8Zjks4fKQrFzDa55NAculcITLlWLcy6f/HN5f37z
 3iEp1Eypcz05jzLtnMPSwS4sxQNnSEKRprYJxj2lEs9NJ0vbWQB/Zrp0eF8G+Js9ozlKAcCrZdK
 mCAHwAOIjsFMLh2iRQhIQ7Det3i3Dlf4nYyu/12ekjqW2VNXDcSKgUaPcbs7xIoKd4mkR91s3TH
 sNOpvFww4+/O9Dmwv8HeF2XIGGcJDbTp55OeAP+mMoxI7b3uq3e9vdn/VP4Dxjz7I7SXusWyo+v
 BmpGuNL57UfB8J6+PaQ==
X-Proofpoint-ORIG-GUID: Dtn7rJjwbmHcwlQ-d81JEGtFWf3yk-Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_01,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190048

Hi,

The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:

  Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-kodiak-gen2

for you to fetch changes up to 3da84f1b4bb062f18d7f08807beeb46328e06d46:

  qcom vpu: Add video firmware Gen2 binary for SC7280 (2026-02-19 11:01:56
+0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom vpu: Add video firmware Gen2 binary for SC7280

 WHENCE                        |   4 ++++
 qcom/vpu/vpu20_p1_s6_gen2.mbn | Bin 0 -> 2030620 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu20_p1_s6_gen2.mbn

Thanks,
Dikshita
