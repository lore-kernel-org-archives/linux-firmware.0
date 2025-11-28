Return-Path: <SRS0=3wck=6E=oss.qualcomm.com=yushan.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB34CFD376
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Nov 2025 09:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6192C113D0; Fri, 28 Nov 2025 09:14:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB4A6C4CEF1
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB4A6C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P9og2986673
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q1uorcGTNGJaMKfwhvX4kM
	W/msPgOkQO51q24kVg0QE=; b=bbesfdsd6iy6p/He3waGRBexHNZsiKiF8cUuP8
	7727Nn+C57CJiIdu5KFLwt8x5eTyGrMipNBIzjhUumOGGyYG5NOEkW9Hs2vVMmJU
	uXepba3QMFDFbldr0Ax5vbd5bLk8+Rif7+NF1yl+ruilJ/z6Dg7U6eIx/3ivwgXx
	MMaEawNaNheSvJA9hF6WH0VeJkNLnl0Y3cdY1OHn4aEadlZppgjeBP2qH3DrAM51
	h297k86qYSLrz4szBLKi7Pw9GhgZ3P9vrImL4Id/G5mtbVI1hZe+1vUGFwczRAsk
	4VkZNXsLlm2r0ipCuXUodz8LNHE0qjZkmLEqUgIOf4HvDcWg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxjrd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:14:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so1734927b3a.1
        for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 01:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764321283; x=1764926083; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1uorcGTNGJaMKfwhvX4kMW/msPgOkQO51q24kVg0QE=;
        b=Qz/cm+DLeu7+ONgsM0PDTsPnKeIt3v6wK2OoVrMFDshafGGzwCmerDBLYUSZ4WMP24
         TZs1vjpnhr0sTvG1cY5ACBzGlgefpr5WLWTuWhbAcw125yomlqlrASqSVyWR2x82js8o
         9Gmin6EqrpDPkorIW3YwJMWimjsWOKFJuPg3RpWY9WcD4AUEMsQt0vYWn6qJvU1nnQN8
         iV8/hmwtPFdMj8y39b6zYZqIIu4mwUOKYgDwR3YpcF4L1sDY3fDBJM0Y87t1NpAFpzWj
         N1zAXdEc9kPZQUUlAuwUJbJSE0XC/nq+wHI1Xna/5PHHot4etGM6dPYb6CjbXC5nnJP3
         W1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764321283; x=1764926083;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1uorcGTNGJaMKfwhvX4kMW/msPgOkQO51q24kVg0QE=;
        b=GY+kX/7u9yGSydytrCdoUNEaPELvWmT6OSmYKVAb8iaenAA/Sv0liJ3voB4AXi6tJy
         2TLcq6/JfbTIDJTM1Xt0awgZynkoo780TTFR1GA7nI0cZ21SjJMqYUd0VXEG2mBD7MZn
         egp76a5I3sOiL+QdxBt7g6ivukW0dI82YrrdFxGLazLGP9OXyM5cKgNB1yI/GQAnug7x
         wKmnKZrphV6AUfJfx8f1S2TqGgQsys3UFyCYxQlijg0l3gJb0Dg2vTqYH4GXaNGPizbJ
         KSSUt2u/QBKwkDdW5mLy9QyzWa0wUFZo1rG5XzP349OBALdjr/wbxZF2RWQAT7dqsvDw
         QSeg==
X-Gm-Message-State: AOJu0Yyv6E0UwAqTPywYCRWZXbIbSWvoZKUyXbWz8srtaiQY9S0CG0Qz
	NUg16AujMPBYQCcu3Ly/CV9LAlZQoKByieL7wa0SKokof6mdYlXyP4UabjE0hZzg6pzt30FXOmY
	+UaKNU3CeMwK2WnLznIUdLJ0koKVdgX++aByha7iUn0jgodzP+VswasUF+LpDL1B6fVCBooc=
X-Gm-Gg: ASbGncvWFeMWJnkAdZRRAmFpIzXkDHec1SXkE+vVjTpdKDjv8r+gkRn98axZpY7U3qa
	ckW3xXuXjTydDiP9gCLDB9YI5K9vEDM/sgDmpAFW5gml7hlJpUGj6gPBIdtyC1KAxA8w3ALn24i
	cutstcwuSPmlFIPujuW1zvC2D7wjK8/KtOF7vEo7QmMEpoWF5tf/OHCz7VkSkYm3z0hy7naQHaX
	yv643Hm9Kyy2O/FkNsTEGZUe/UPzAqFMegUlX3KerGuFED6ICm3g1HnY68vg/FHWErvHdjXuADN
	/uDOrJTE4gw/XwfkNZNtYZducrzI3uuQnCod3aGSlFWTwHBPCzUn/WRgdxqD99ELJ8rDyF1fUN3
	9kVysUGZN2PdWKb1QeyRXZPayHH68FAJRcFpsiNWCarGrfK5umvx5rfbfmf1nSVYDEeeWDcJ3pq
	V1
X-Received: by 2002:a05:6a00:a91:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ca89a6a2b9mr13946029b3a.26.1764321283081;
        Fri, 28 Nov 2025 01:14:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO4xBPh9KH6Cvhpvi2dMjytRnqx5UUsNJ7P+HoLOy8xeT/TnC2Un4vxucs3m0Zl15gmYjKKQ==
X-Received: by 2002:a05:6a00:a91:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-7ca89a6a2b9mr13946011b3a.26.1764321282533;
        Fri, 28 Nov 2025 01:14:42 -0800 (PST)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e7db416sm4241650b3a.41.2025.11.28.01.14.41
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 01:14:42 -0800 (PST)
Message-ID: <aeb95be6-2e42-4f0c-a34d-a6453790819b@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 17:14:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Yushan Li <yushan.li@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for x1e80100 platform, change the license
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69296804 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=QSPts3Ynr7ElwMbO60oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: j85K2L42vc5DsqoNRPahe_9tNFbh9oPm
X-Proofpoint-ORIG-GUID: j85K2L42vc5DsqoNRPahe_9tNFbh9oPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2NiBTYWx0ZWRfX5nscDfjDmDeX
 Wvdr+DVi0FpyRYi2/a30Nn+4RoYXYyLobVMbf46jtnPfTkfh53Ig7s7IqG2RIyTZZCaOJciB9UQ
 j7aqu6gCqe9Hv+mX2EdihK+6MGagTB9njGJdLfV0cnWhmcnjL4OggrG5RRtQCmCbWGj82b/XfRU
 lGRp7421ho8BCNkRWZauKO7oythFbaf3LCCYKBYmptvGFGmsUV+DBy5c0jhD5uguCCPZYrUsGT4
 52qKfpUrSBM3pFQa5OtLKWkgicOyFDpYl/20jLqVe29N9eUUE/ZyHPvQgr5hAc0t/wldtUg4GWL
 t/mzxHoLWW80Z5SLitvE5PHxsCOTeW+cAkA/moCLZD7qlqniHNUFYwQy1tzUnC2aK3zEBpF/nbC
 Xy2KKBktIe/2zJzcyKVe0exQseSOOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280066

The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:

   Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
x1e80100-adsp-1126

for you to fetch changes up to 818809855970fbaf8055aff5a91a133ea5feed49:

   qcom: update ADSP firmware for x1e80100 platform, change the license 
(2025-11-28 15:32:30 +0800)

----------------------------------------------------------------
Yushan Li (1):
       qcom: update ADSP firmware for x1e80100 platform, change the license

  WHENCE                     |  14 +++++++-------
  qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
  3 files changed, 7 insertions(+), 7 deletions(-)

