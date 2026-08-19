Return-Path: <SRS0=GIQg=GM=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3EEC5DF85
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Aug 2026 09:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2A281F00A3A; Wed, 19 Aug 2026 09:08:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787130493;
	b=zdqWEnrvuiKj5mDZgTuqeV7VuCgJwqKWExeD6rG7V+zZ0ppO2qTvN+t5SxeJ6m861C75
	 +VOJfbG8/3h540fpuPImx2xnyvmZZES8/SUp+FrmIELxcCFMpCmtWxYSF0deVmvNglC5m
	 Q2fh9FU7iicbppmblGP2ixtRlKjhtoRBAHFNGeshdVutI61lyqUqMGfRH4VPdJGTFF+CZ
	 a0zTJCSwbg8smd4NVxcu3RVKWrraZBgVT3xan7JbjxfyeXvCBcgqrXVCKdVcbWp4HxVYW
	 ad+B4UBv0gBNgGbvmIByPZu2x79YEQsPX+ySiNzfl4o/heHUF0d89ZoqJDhkT4l/sLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787130493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nSRUJaCovHGj2a2RPAtkGRDBrQcMOFq90xh2OqnC+RE=;
	b=VJ65oU1n8At0Ouy3y1ozpr5ZZYznThsIAgeaCE73f8I/qGhhToFNbJLoqmqGMLSAald3
	 7yDaf7jMMidNyIy/6aDHy/65Jm4cgiyB9GxmLtLvJtkkghgs0NooGvSp4wDFwwKZtYeG2
	 6JLw+YyQsMzBh3EoVXNoN2i7U72gzOu6FABJ5EoQV65mKA+Xo5QBlJrKjB+h62laU5R+e
	 TTX/EAimtUqDXMmqWmDpY7LCJ9HgG/mL8dpMApUdLKzBQSl9wBhDNE4oMd8YTGbHvyMOo
	 kqrlvWyMLmt6CwINK9jNbIVat1+K3QKXtwkKtxT0TGZw3l9t7UoOxWI6e/Iu05T6P4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqFgC9z4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyU0kYM1;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 393FD1F000E9
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 09:08:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqFgC9z4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hyU0kYM1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 393FD1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z1WY026589
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 09:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nSRUJaCovHGj2a2RPAtkGR
	DBrQcMOFq90xh2OqnC+RE=; b=LqFgC9z4oyi1oyy5uObPgvWhN9ZS4Dv1zNn4Na
	qEuEH7ZpZKrrmg1PVDmPrYtPIVec7ebDSiV7+hLRwVSF6FqjNfELRQ8CvtU4OSGA
	5/+R3Th+UurCLVBpFSndpiXdZb1mFbwUPl4aJr1hibHTrtpDpadPZjD/mSqO7VIw
	KEqRB9qdlCnfwnMTbvzYEjO39piexlAOXdk8bOWPO/PsqIUyX9peXlYV/dEgwvnt
	CI/WWJbcpi07FQy8pfJebLZsnWXGm/jn2fBm6rpMxbUMLgxJVeZqdfWEZ1P1T3uE
	vS+omwaQkRSgnSjbIWd9y5/5xX4rEYjflnSwY3veqP36jMnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpta07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 09:08:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1285662a91.3
        for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 02:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787130492; x=1787735292; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nSRUJaCovHGj2a2RPAtkGRDBrQcMOFq90xh2OqnC+RE=;
        b=hyU0kYM1wWwstWEz+oOFrIjHvV6/c0Fiz0xVy6GLurNoNagjR2fuPG0B4LvEWPiw7U
         cCDDuzaHl/vmwRR6bVF5z0kLKH7Nyfu0cswFEyB6iZj8eadLA5njYPvHFpVxLDlvBrsk
         41p/eG8BRdkwTCQY0Bbjs79HIKujBzr2TdRnwSpiywqJkUt8isYclRAUpWr3G7qsUtOR
         j4R3l1eKu7n5HHAB34xsxC2FSSKkhmdLpJLTYRhrPk2SVbs0ZnefNieLWYgtuCtt1ZWo
         Gb+gdvHDGWG6YJtcZ6MSVFFhSACptDGVDGdCNdOHcQpf3ObWyygnHQIWfDkRO4v6RtY1
         dcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130492; x=1787735292;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSRUJaCovHGj2a2RPAtkGRDBrQcMOFq90xh2OqnC+RE=;
        b=V038v8nfjV0CuEu6xqyjo2uWhpj0y2baVLaO4FbThN0TrKlk+LgK4uyR6LQE1vkBg/
         CiwLRdSqB2SnaAGCAKw26lylX1kFwvU6Xw2jcdFynu4SARxghEHkCYHUB++LcUnrbbHF
         smiKrlYoSfF2k3GilmAUQiSAxNhNR2NU5fhXVnFBGmvbgoH0Rz8RlchsQj65ap6Z6zEd
         blmF88Y7yHLE2/RxvP1MuAgTSwV7Xw8zcM+BOY+1YU/R7M2FzKhEq9sX8PhGOfGw9q9s
         N/5ZjffUAITwAtvaOSiWAACEyNKa465T3+HLY1lz4QjIdrhxV2PVLnRJN2Nosrd5BwyN
         wCVQ==
X-Gm-Message-State: AFuF++keNcLiAa0e2cSHGCzojlUj+UNYfbWaUCL8m9D47pwSmQhlHnrg
	f/S55zqzATQ5jmcEPnixEdj9npHBMSLtPSeqVhp2fWHsgu9HnhUEI08G3U06AJkvijOyhgtqaJi
	wD8oWkn+V93jZm5ijAUyjhuRCqbECyfDoCySxRnh61AH0U0/pD35HZFKM13wjHSjn0jUtF9s=
X-Gm-Gg: AR+sD102hwmPSe/Bp5kwZOw+QKPrsNhtEuDGW6W8mFFhkEKM2KQb5xTlR3cE2pMhf76
	0zc+wYocpVazCRMJSBIbnoNdsjCJIcFjjnem4QeJp4eB6s5UK14Uor/vXgc97aid0lR+zbYEskG
	n0ofdMIiOxTF+BTAzANwkNqgEnK3qFt+HOfAqwRPh5sK96E271VVMyoNxgnXorAP8sLNmnhZbWe
	Zo4oI4ctXSJD9TFhUg+7I0DqqSt4DTbVyEpKs+GiabSD1kO9pGFVgo2CEDf2NmIfXjhlXb/WdI4
	hWUSLFebKvCLCYxU7rjUrpRftrHsZWWBMQItWn6eoQCGCH++Qn24Z5EMYExPEvlUd2zOgULdm05
	8kSKgDneOK6lxovU7lPxoNHVjv7yN
X-Received: by 2002:a17:90a:ec88:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3958128686dmr5976479a91.16.1787130491584;
        Wed, 19 Aug 2026 02:08:11 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-3958128686dmr5976383a91.16.1787130491102;
        Wed, 19 Aug 2026 02:08:11 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbbf8a7sm1984325a91.16.2026.08.19.02.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:08:10 -0700 (PDT)
Message-ID: <069ac343-254c-4ded-948b-9a78ad665ac2@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 14:38:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add NSP firmware for nord platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IiyE5BjR9lUa1rEUmFtYjOosAAQAFBMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2OSBTYWx0ZWRfX4qvAhqezCF8x
 qLatwifw+pnS7w88Q1Gjoaa7qGDif+iR10dD1XULv4DuFpuyWuVTxd8ke6yp6l+sD8PnnmBb1sA
 mF1GrJ0ytcCD5r7Hr3YJV8+/rt8FkCzWpu1YtTbYxP9I+HWA0DE7w9kjwUHT4EGbZRaXcv9xx0h
 i5rbXiNYuqOigJrezDmvaFfyVDkVd4VWLTXyBxp2QB4R9zdC1YoUSOdOgG7MLO7AQkbWwtRH310
 QG2giI46t+CBRnJPwa7MXbiHmy718HmD5pYKEoG+MNXqiJX86k5QtzHqoGL1b/1AFrw1dWR8zGm
 I8hTBqOZJQDrp/gdWQUwkbttQNdoQtR1/AZIhq0J4oUmceXSXo/sutdfHKefHAClZiIHeVViUei
 I7JcpyENKc4GXZlsyi1MM58NcJvFjJadwj7c83AMeXuurB6iFLZtSgDTW3MWp6LgkT9BCfgJyCJ
 E/6bzLthRxrthjtvkMA==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85727c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=-ut6XvyEhAzec02KXuAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: IiyE5BjR9lUa1rEUmFtYjOosAAQAFBMv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2OSBTYWx0ZWRfX3lncfB6aZ5vW
 E/CY1iVVr3VGnHCcqRpKO5RHDoSfoGHXca6PkZy3nprAH/09IKvqxyp4+ltHQr9WvRvFp1QfYTk
 u6AsWAUtkJx1TAXMOgN/iddKKKFgBP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190069

The following changes since commit 0a6871b19abf5d6e024b5d208b101ae53e7fa0de:

   Merge branch 'robot/pr-0-1787066669' into 'main' (2026-08-18 15:29:47 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qli-dspfw-nord

for you to fetch changes up to 391e1aa5d6c425f6790df7a7266243b08d4fa177:

   qcom: add NSP firmware for nord platform (2026-08-19 14:33:54 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add NSP firmware for nord platform

  WHENCE                 |   6 ++++++
  qcom/nord/cdsp.mbn     | Bin 0 -> 3347164 bytes
  qcom/nord/cdsp_dtb.mbn | Bin 0 -> 131072 bytes
  qcom/nord/cdspr.jsn    |  22 ++++++++++++++++++++++
  4 files changed, 28 insertions(+)
  create mode 100644 qcom/nord/cdsp.mbn
  create mode 100644 qcom/nord/cdsp_dtb.mbn
  create mode 100644 qcom/nord/cdspr.jsn
