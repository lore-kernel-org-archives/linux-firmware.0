Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0ED606A320
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Oct 2026 09:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKq65An/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2Pg7axM
Received: by smtp.kernel.org (Postfix)
	id 4929A1F000C1; Fri, 30 Oct 2026 09:30:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793352604;
	b=BXunOsmH1CUsqb+jOvCoje/AY/v03H9biAinxRZ3uDJdWKAXH48xwcrt4hucgECWHlc+
	 JlZ1nvtkPP1/A6KVnk617xP5k06j6NFD6pnLwGJmG+qbnxxXUHtVjkhAM2k+pYbTIQT4q
	 Ri2tZqPGPu7bjp++DDJMo/cHnKN/7VkcVXGRAamyDmpZhGbF+4SxcFLSaZFOSCslC39OA
	 20Lhcki10zAuAAWkE0Xd89vDfeS+nPddRBbBDG7RKBwKBrkE0JUAZ5x1cxtdQgqTC38P9
	 pDxpia3pTNe9WZM8kZJrgzI7LBboZZpapd8S+81RtqrlB0ylvReW/ZHC2f/IEkOEI0Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793352604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TnFAINeJe5lpY3Mj0jW3OlZPvPIcAnUL62Bgrk4I8Ng=;
	b=uso94sTP0ni6R7N4FJXErUiSlA43GGxsUvet+rKicowuJQKJkqoJWTIeyPAWkXsyVECJ
	 8+ybHstuqRyjtPJunc8m6bRJcEA8Z7JY0XoXruQWgpWzIFMPwB2NuZHv/6LNi710Jj4iJ
	 FFvwSF4y4E7kEx7rOEIJURjJrt6t6qZDWTkNX+MWxFSCYYYneO1rpXfo6FYi912jFTY3/
	 41sjCpGqvBkZcaXXf+c3VgTRIFWqyjVl956qg1A/eRzrMOjuuQuTtXDjunOyc3INaxj5s
	 TDABBvmn0qaeTISELr6KmAAC4UWh1m5cF05825D55AO5T81OE+pkCwHZS6OAQRcv97Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="eKq65An/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2Pg7axM;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D1451F00A02
	for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 09:30:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKq65An/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2Pg7axM
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6D1451F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F5AP1120769
	for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 09:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TnFAINeJe5lpY3Mj0jW3Ol
	ZPvPIcAnUL62Bgrk4I8Ng=; b=eKq65An/xriKXhtYDV9t1EJ2LQioQCIdbhxUIB
	+5RKLoraMuqsv0n9xJoc81PLiAz/RuFMYPd0VrlEZQBlmfqtgi5BpjiRRRHrINX5
	5zI7nIVVf22BPEom8rbBp03P+Gu51UDAZNs5BxXqbxzL0SJnpsFN6qhtQ0c1HyNL
	tHCDtE8rmcqdRo7dJfo+SEK9OiLZZL7RixEoDJ5hAOC7XTJaszQ8YNWTez88w62K
	hpNiiT9LsuqYXKrM3AylKiGJt10oVRJJkt850z4oY1hBRCRskaM4XlM0OBdxjAHX
	0zD6p2r75N+B5SzTL4PVFQEgXWViS40aGrCCqS9kOkeRSKmg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pj798-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 09:30:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1411244eec.1
        for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 02:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352601; x=1793957401; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TnFAINeJe5lpY3Mj0jW3OlZPvPIcAnUL62Bgrk4I8Ng=;
        b=K2Pg7axM9Xzi6J4rRhAPMexqx3JpEV5S2VxVdROlSBSGj9T++bcvGgOf9x0aLJAjK7
         cVt8tLNIEuAxGS+q4xY6A2ze/meVCpIiuccx+bPeNszDKd08BH31siN4/fRVT9TWvL2E
         WjD2I5KU/anbEeA2x8znFsQbn8vcYOUTWLfQyckfuuN920rRjr1/SzlWb6zG0V9Dod70
         2b4Tf/IdmCBEhXVtjGFmQaTu0hfHcgYk+1+vXLRf7/40Ne4h8dMbg6xRpUk0HRQXH5fW
         rzIbVm5A+0kdANqm6XGKrltxE95n5BFlBjoPKwVvCAeW1Zcb6X6g75ELMpQou2sKg/Rz
         NdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352601; x=1793957401;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnFAINeJe5lpY3Mj0jW3OlZPvPIcAnUL62Bgrk4I8Ng=;
        b=0BONl+ZhX73G8tqKnXgliJ60DPlpugkiiJglXNfozjfVQgz6lrue1m3hPG71NZsZK2
         iUjKrJabE3/UYsAtpmh8YCtWJzlAByxHLbz0vyRReRV4PzD1jnI4/7a6nwQgb5OaGUWu
         LlSg2yPr/LkFh2W5z5DH0D4MJHoWBCq2WfgziXwlF377aMuqSenxEUps9t7dJHEirBhe
         QqgSxFU6Dym5Lpgy85ZUWN5yX7KexuWOTjwKc5j6D5aYaMy3z1EbDBi23hnNIj01DqPU
         FRT5uZtyx8xM0xAjkUHVXtntzVlEjwLyGTqb1OUDvitAv/smWfPbQTXPAsxjWFRf/R5x
         LfPw==
X-Gm-Message-State: AFq9FYJSxX6eoQ4vAMEtQp5qvmWWbMrr8ULILCREA5A/mMLo4Pu3wQsl
	uf1sHR2wNriUhlosvB9ymIVUbLtcDV90i5KYqQagKLZ8fM8j+V3bJGRnMwi4LViP8akGb2BNer/
	U16ZsAnoSmRihWZad8KNSgAQrXTtBLoLG9ZSSNdxQu1VDmLm52OdsuYmlke0aHTq9k/R47oo=
X-Gm-Gg: AYBFou1t1LWLup7gU+TFDmEEQW8lP3aoiIB1VQe6jpmzmIusYfjfx7sQDPgD5X0lZ+K
	Kqhqi9LIbGdjiCZwJM1Dlz3uMRe7GSZqv6tRKfXaOf2k1VF794Z8VJSe4w636IvtWXMwdmJiD6K
	hqQ8gADryYzojqn8pvyscEKyazXQANxJiRx9ff404w6vpBftNszqJZTN4QIKYUWb3V4DElbVDeR
	UFLCCB+kYBeXSWgBJDJFqyue1APtflry1b4pp59149taDmIx+WIF4DfYokBlDuBjRJwSLe5aimW
	X1zVO5G1mrMPfo4WeOD8C9+uGHk5gQX6uEfSBkSG7jP3gWZyUYEEyGy4z81ZbsY2SHzce8Xs40p
	Uik3dYtwWod+Xqa+a0KNsBCp2NbzsjnZLpCoCfHCFlvjvCbuaxBCwHg8g+Gd38YtvDgog4N/avS
	KM
X-Received: by 2002:a05:7022:fc05:b0:184:992:c9ec with SMTP id a92af1059eb24-1ac5fd06166mr1750496c88.38.1793352601270;
        Fri, 30 Oct 2026 02:30:01 -0700 (PDT)
X-Received: by 2002:a05:7022:fc05:b0:184:992:c9ec with SMTP id a92af1059eb24-1ac5fd06166mr1750461c88.38.1793352600505;
        Fri, 30 Oct 2026 02:30:00 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6628556c88.11.2026.10.30.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:29:58 -0700 (PDT)
Message-ID: <b9c4aa6e-8fe2-49a2-a63f-c4c3e6844a27@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:59:55 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update LPAICP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX7npDWJGzT+gF
 iURjd6JODblbm9V6UVLPp4Ns47NVXtO0a4NFr+0i3kg2gEZ0Zqwul8XyucN7NXGSxczFiTAse/G
 ecAKTWnlTLI+VkXfAO7xRmk+9bZMzf80C0opzqd6eYCH6G3dcKl6T/jVl5jZGtlkbEwpsXMgpQv
 mOW89YfeTS2vAbzfcfyLqfbRNr5vc2DaxZmO2FW1fxXRDFIpWMSLnhAdVI5T2dguGyzsjaZHm6d
 20dMVU64Cr78gLJ0qDgn3l6Tfr6ZsUwUf0SeBg22rlO+mFWyL8GaPIKSE5vPfE2qTRLcC7SVvWH
 wUp/0pBtIzXmYaJlg3d1QvqPgZlDH2g8gw3Y/x4vEtl/suGco3CHm++3JlcT7pkIGxYT/rBfYbZ
 XkVcr0Nw6Q0oW+zTf/rDZ7pYrRdaP0ZENvXIYAOA94lpSP7sgibFjNOmuG+BbLYWMygJMBQvSYz
 D982BowT34oOVpTm9EQ==
X-Proofpoint-ORIG-GUID: FtXfm1c_LTqKZvviZVzophx6_YekhRrp
X-Proofpoint-GUID: FtXfm1c_LTqKZvviZVzophx6_YekhRrp
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4639a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=NgcbHcand80vujXJOyUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX60hoeO1XwsUX
 nCTeN43lFCQPjspIyJoyDcnSOITiA5QI+/oJRAViNzdjH1fq3voipyC2AfMuFWmWrgN4n0JSHy8
 ooA3bUaY05xkaGAPoz/ZUz2QRV/bycM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300037
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,KHOP_DYNAMIC,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 33af2bf0c14509fca10a2fd53fecd6282484a6f0:

   Merge branch 'robot/patch-0-1793325085' into 'main' (2026-10-30 
01:54:47 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
lmcu-fw-qli-shikra

for you to fetch changes up to d150d0c1aad6c8846a6967ff485d8c3184baf799:

   qcom: update LPAICP firmware for shikra platform (2026-10-30 14:56:51 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update LPAICP firmware for shikra platform

  WHENCE                     |   2 +-
  qcom/shikra/lpaicp.mbn     | Bin 1258435 -> 1279149 bytes
  qcom/shikra/lpaicp_dtb.mbn | Bin 39760 -> 39984 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
