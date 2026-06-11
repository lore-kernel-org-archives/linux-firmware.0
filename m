Return-Path: <SRS0=rQ2E=EH=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A549CD98D2
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jun 2026 12:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31F601F00898; Thu, 11 Jun 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781180814;
	b=OpVzUAOyYaCDc3KwJHFg/XJUSQDSmPt2QjJ9opLOxwJAI8cAlc+1LfnAhGSLNoXPE/bZ
	 iYdBkCOKrZYp2se0uqoRc7Nese1sRD51E3e+ESCcADcQNNkZ1hT/v9y+044ilEkZfMkJn
	 A9HKN4WLYsklqULse6PvL6u5sR2j61M02+nyiymcdXc0MvqyeN/ZKoTR6EC6wa4ObwkUj
	 aS7kpj56zPVfVJMRt31qbG5VnLl4wG5Xk911XgUPjnEJrtvT5IyHeucj0iC6FI4s/hYab
	 Wt1L40Yncl7eETwv5li/YZ7SUn9/3AXm4ttYP1QHCG2Yho+QmOnZkJ+fNU97CavcxPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781180814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cJcigN0+vOT/0AEhqhcBBX3YXwZJCsWCZn746NjE7mI=;
	b=hgSZXtASyPfVxhhHoQOnXPxE/lRpzx1OdHxwo9GHIiJ3SZNznaB8GoTKgvZooDHcFSL+
	 QdnKBqIfwvJi87VV8KNUAr2PtV6xUXna1vJvQmxOPrxnwdrrWXynV42+qKZEbk+fhHZGx
	 J6eFTznIhwVOzTPAC3XYKsS4kdR9BLS0N+qT50Ec62pfJRv992uSycNYM0vnaQXniCUtH
	 dV6gr7o70YMDiZHQnR+jzij+LUyDYziWZpTs4wa1ZiVs5J1Is+6q1DLsCpiUdAsTw0It+
	 ikCG3nuKqj0jP0u3MeImQGXCDteCYlw10gCFZKTFF+sO+CDpD3z7HBCv5YJ/0qdH5Zw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhQrAYp7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HWMFm//J";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75A9E1F00893
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bhQrAYp7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HWMFm//J
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 75A9E1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10lU299638
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 12:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cJcigN0+vOT/0AEhqhcBBX
	3YXwZJCsWCZn746NjE7mI=; b=bhQrAYp7NA4a3wxy1IHu1fVR9KF+EFudjIV3Am
	oiqGsr+6NxJcXU3utnZQJzfsofKOJcdCbY5260sPQRIyzlYXGMNGbOnLtsUlXqx7
	FOIj8KoS+P/PQkZwkbYR1FCmpBLKvX0R6KJP/U9AaBPIHejh2GpYkwd1S/+nSnOA
	0sB8A65Fet2xZeCq6e0XYmWjFfvfA0aS3HYErQZhRO4In+gz8gaPQadU5xbtpUhS
	EKrjUymCPurSguWJ+jE3YyxEshdlqCkqn76YM1bYa56ogZkO6McIfVG8xOLdvl67
	4nxcUKdcWLtc1NnEX3hmav4qlcy4BY+GOp/GOzs2nw2MU/Cw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe703awe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 12:26:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d65d9792so8817325ad.0
        for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180811; x=1781785611; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJcigN0+vOT/0AEhqhcBBX3YXwZJCsWCZn746NjE7mI=;
        b=HWMFm//Jn4RRa3YRHdkv9o5fc2ozlStDqNK9UUPUGzIWAOhgN7tN2xJS/2jPDMnzjq
         R1nrchZE6rHzQGgLKFr5JWQakJ6Yraj+HSYu+GZOQuIMN8YL/RiQ0kBJa/v/YS2izLWO
         ajAgNWCO5iRH6eJk6ZLmkVu2my+vSLdGFtbkhaNTI3CGI0k6PiMIsiaMujBL+dxZs4WS
         8nNrIy10eH3PSGwTaeHf8/iBg3QbTDyuQ21PdXN/y8ST+Lfqzq1gn0VyvgGJwpUyi9x8
         SVftFc6QZKD/Mmft+tUoSqeLZpY82TDvEVOAVj+M5bx25jtqTfAFh6ldlzQjRQYcVAgM
         uI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180811; x=1781785611;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJcigN0+vOT/0AEhqhcBBX3YXwZJCsWCZn746NjE7mI=;
        b=Awrq/HUWaOH1Yd+uoURrX9LCdqmwiIxrvQkNYmZo9irFDWjWEPnlYHahChRbryZY4Z
         eW66E/pddkFFfph5TShVKFULE5D9UP987ogFPS2ho7rMptV4V/lbPh/SrqnZI3Zo2xHa
         0YZ7c9Fh/uX7NghXuYgg51qlEYYdDUyhu665YSDPhLu2V69NwhrjIdVanFcb5mbGORNp
         95HsflPeYsKtovnvTMgLz+EJuoBd2VYQHaWlBQHz/2gMQRerfE/Xz8D7E+LT4g94dYba
         9LLnRPAoy5QbLnBdHggjtnHXcKCpW0PyINck0hvraCF/kBDlts8tDnQVGJXVQ7RtyidZ
         flgg==
X-Gm-Message-State: AOJu0YzDP7pmf3X+w5OsrQMKR3zUvYh0hg45Es/lSTRuMnakRPhO9oOA
	LTaVEB311TIZcLTjZBnPxvKMHSM4M48MyCMlP1qvE5z+8Pqc/JvVJE1vHRTrhtgK+EQ4aFXa0JW
	sSzQfRZ7B2NqHYGj1Bo1PrFAYDCRLUK9CNeAnsvo08jjVrPgAiVDciyWV2eDUlWDPlxu7ujs=
X-Gm-Gg: Acq92OF9JdhiQa8LanZpIb0zoQvF+1dXAhDrtYAk1yA0UILf0VEoWfKTsQhEn1of5O2
	+RqkZWl5z0XCqtHuryie9qoF/+U1M1N/DSGOc6VsSD0H8MrF3NTht5bf4Eof3gEg0BYq1+QkYfv
	/8KCU8pRGtAP3ELw6dmNdqWqHooNUrg0ls60d/4yNZ6xBEiFrRvI8nmH/hHKroUdDDMTSHTgCnt
	LBpFEnyuWU6V+L/kyJ92rs3vtMspmSdBzj7r9Acg/+Vur380bKeaHec2IsfWsJdhlmDISSDx3RD
	F/nKjghcj73SlD4FyP23in2pULNSXDyl9OxHAUnaaOZZ+TvrBT/KwrVGjxYaQLvNnpBYm9mrkE4
	8SGTdyiPncty6qj+GpO21hnP2/PH0s1e2ymAuX/0l7dSGFNBymOk+mbpbT5y+UA==
X-Received: by 2002:a17:903:947:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2f305aff9mr34922145ad.27.1781180811294;
        Thu, 11 Jun 2026 05:26:51 -0700 (PDT)
X-Received: by 2002:a17:903:947:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2f305aff9mr34921715ad.27.1781180810743;
        Thu, 11 Jun 2026 05:26:50 -0700 (PDT)
Received: from [10.216.44.111] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm283439705ad.3.2026.06.11.05.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:26:50 -0700 (PDT)
Message-ID: <b7c28bf9-df8b-420e-8da6-23d577f2615b@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:56:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update CDSP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HZlF59_t1Q5H0H3hDpcgacqBcvdGTQHn
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2aa98c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfXzDcNGX16J01t
 IS605iynzAtRCh4BzzKex8q0y2Yy1Up6jbtv1twcpOMWW7w42PgdwoMC1QoMOhpgP9p7/qYz2Wp
 87DLyC/TpSNjm2vYpEIUD6KEaUJ8BVvkXk1RAPauJGF0A3KY/xMq5bRCFtB9IvUsQ9oWYiVP4+V
 0NfEUDmYCAV2SeFQQ3dZdM4iNZzWSNzOwZE+iSsYP0PWozUXQKcfC8cg+X6eZe18GnZwLgzzznt
 +dCn4oaYXFe6yHLSUFUBkEGBGXVXy139UuE1cqy1L+hs42bY1ADBv28VShvLeBotcSSt6TmZBP/
 bG0OE0tEX+heseD7XbkYe3Irk2IE39nZzBD3fG2E2DImCy4S81MVcS2FWhp2Fzb4SHaUWzpk6LJ
 pJztCqe+tJ7iXKzxiQ/h3wQuGfGdAMFt7UjMpFP0Rglik7csta/sqH/HW7zlG1Q/bzswsfyuZ4C
 jzVZ86pzV8DP140r1jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX3HT3LyGrLJnU
 UFCZdawAMuR+ny3UwSbm7UWR7C5LYgmIQ763Jun+v2W9SjJwD4N4+FwWBQlEf5WjGhHs0elVisp
 h4odeQBps6ZftUvD8IIA7Kv8lYMOHyk=
X-Proofpoint-ORIG-GUID: HZlF59_t1Q5H0H3hDpcgacqBcvdGTQHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110125

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-shikra

for you to fetch changes up to acb740a9bfaf338360ff10dcfef9e2a6a4feb53c:

   qcom: update CDSP firmware for shikra platform (2026-06-11 17:49:56 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update CDSP firmware for shikra platform

  WHENCE               |   2 +-
  qcom/shikra/cdsp.mbn | Bin 2614680 -> 2614680 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
