Return-Path: <SRS0=40Cg=6V=marvell.com=dchickles@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1002CC64ED8
	for <linux-firmware@archiver.kernel.org>; Sat, 25 Feb 2023 00:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC13FC4339B; Sat, 25 Feb 2023 00:27:43 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B02BC433EF
	for <linux-firmware@kernel.org>; Sat, 25 Feb 2023 00:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B02BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ON9FJ6019978
	for <linux-firmware@kernel.org>; Fri, 24 Feb 2023 16:27:36 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3ny0puh524-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Feb 2023 16:27:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiC3nQfOTw8QvngZbr1yOJoxyIy4gqbxK8IA0r8WEaqACl0FvoAj5qUhT2BCMGE6321j8QygYjyX2/HFrpATD7smzAAriQ70kG78s+VIpw3vxwEW7bcyDifmnnnlXqsFWtiF7CiERy07WrfOkmXa4w2PBM8UFbynR4vl3ASHQfO3lpR+WBjpAxG5f79uck2RSAsyhhXK8edkiXMCH1tGV6j42V9O5zD7RqeZ8zf0073yrlazo8Be1vjvspB2B0lDGO64DaFpm/gr1HOoPDbUSaYcrv9TDJCmEX2ftz9fLPjXnTOVjMB9qXrcyo6PRNgfo4sYhD1txJEhaw9HBJEHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAfwBkCZvmJkQLbfMrdm2VV0821A5oi7Lo0ry1Il/y8=;
 b=XtlK8ebQZXbsFB/1RD8hxwOw5IFj2sXMi5re0CJ7pYQaAlNx4KrpNe+sOsGFCH9jXb13SDhqVYzmf/PyACXymSxpFA1cAdLsi4Cy01rfI9nKe/E+qEtYuY9Z2r1RHDPw3GOdp5293y+pSH7lZ7rYatP4xV2Vur+4xVaP6PLHTwdxSSW7pY06b8L5F+fGVaoNj2PnKkoYpIprcAukrz2QjnlWxHQAC//UnPb1mVO2lgsPOCubJigU4l1mO+T/YaItq+/HNJeTJoEFsCVOC5+KPDujI46BGFKN8TsvaZ/pAPNrmF5RQlPoP/FK0y8tloBJsCOyt/JCsyvjWuC+GeNNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAfwBkCZvmJkQLbfMrdm2VV0821A5oi7Lo0ry1Il/y8=;
 b=EzJn2zImvZw5/8Uh19grFBiKkbtI1dw/+0jRxqST2ky6LgHp/hWEy9cNvDjuqSHcFUfSawgJVfSKJpdmxM//VWW59MNDqzuvyX0aGQYUfWDEzw6IREr22s6lMzuBQgY8MhJP+nHOUsfBmM9vgx4+Jvivgjd0Ub2FUx/O0opJnhs=
Received: from BY3PR18MB4785.namprd18.prod.outlook.com (2603:10b6:a03:3cc::18)
 by DM8PR18MB4440.namprd18.prod.outlook.com (2603:10b6:8:32::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Sat, 25 Feb 2023 00:27:34 +0000
Received: from BY3PR18MB4785.namprd18.prod.outlook.com
 ([fe80::7175:f3fd:1a83:9808]) by BY3PR18MB4785.namprd18.prod.outlook.com
 ([fe80::7175:f3fd:1a83:9808%9]) with mapi id 15.20.6134.024; Sat, 25 Feb 2023
 00:27:33 +0000
From: Derek Chickles <dchickles@marvell.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Satananda Burla <sburla@marvell.com>
Subject: pull request: liquidio: remove lio_23xx_vsw.bin
Thread-Topic: pull request: liquidio: remove lio_23xx_vsw.bin
Thread-Index: AdlHp5fEEgIgfY9aQRSdD/BEt2dGbQ==
Date: Sat, 25 Feb 2023 00:27:33 +0000
Message-ID: 
 <BY3PR18MB4785E40BF7A834EE264B4D78ACA99@BY3PR18MB4785.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZGNoaWNrbGVz?=
 =?us-ascii?Q?XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0?=
 =?us-ascii?Q?YmEyOWUzNWJcbXNnc1xtc2ctMzA4NjM3YTctYjRhMy0xMWVkLTg0Y2UtYjQ2?=
 =?us-ascii?Q?YmZjOWRiMzgwXGFtZS10ZXN0XDMwODYzN2E4LWI0YTMtMTFlZC04NGNlLWI0?=
 =?us-ascii?Q?NmJmYzlkYjM4MGJvZHkudHh0IiBzej0iMTE0NyIgdD0iMTMzMjE3NTg0NTE4?=
 =?us-ascii?Q?NTU0ODExIiBoPSIvTVRIOG55cmV4YlVaR1E1a3VzK3pNNlUzWWM9IiBpZD0i?=
 =?us-ascii?Q?IiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFIWUlB?=
 =?us-ascii?Q?QUM3WkJEenIwalpBVjhMVWdWV05LMkNYd3RTQlZZMHJZSU5BQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBSEFBQUFBR0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBUUFCQUFBQTFGSDNhQUFBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FB?=
 =?us-ascii?Q?WkFCeUFHVUFjd0J6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdNQWRRQnpBSFFBYndCdEFGOEFj?=
 =?us-ascii?Q?QUJsQUhJQWN3QnZBRzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFZd0IxQUhNQWRBQnZBRzBBWHdCd0FHZ0Fid0J1QUdVQWJn?=
 =?us-ascii?Q?QjFBRzBBWWdCbEFISUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCakFI?=
 =?us-ascii?Q?VUFjd0IwQUc4QWJRQmZBSE1BY3dCdUFGOEFaQUJoQUhNQWFBQmZBSFlBTUFB?=
 =?us-ascii?Q?eUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-refone: 
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFB?=
 =?us-ascii?Q?R01BZFFCekFIUUFid0J0QUY4QWN3QnpBRzRBWHdCckFHVUFlUUIzQUc4QWNn?=
 =?us-ascii?Q?QmtBSE1BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVl3QjFBSE1BZEFCdkFH?=
 =?us-ascii?Q?MEFYd0J6QUhNQWJnQmZBRzRBYndCa0FHVUFiQUJwQUcwQWFRQjBBR1VBY2dC?=
 =?us-ascii?Q?ZkFIWUFNQUF5QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFB?=
 =?us-ascii?Q?QUFBQUlBQUFBQUFKNEFBQUJqQUhVQWN3QjBBRzhBYlFCZkFITUFjd0J1QUY4?=
 =?us-ascii?Q?QWN3QndBR0VBWXdCbEFGOEFkZ0F3QURJQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdB?=
 =?us-ascii?Q?QUFHUUFiQUJ3QUY4QWN3QnJBSGtBY0FCbEFGOEFZd0JvQUdFQWRBQmZBRzBB?=
 =?us-ascii?Q?WlFCekFITUFZUUJuQUdVQVh3QjJBREFBTWdBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFBQUFBQ2VBQUFBWkFCc0FIQUFYd0J6?=
 =?us-ascii?Q?QUd3QVlRQmpBR3NBWHdCakFHZ0FZUUIwQUY4QWJRQmxBSE1BY3dCaEFHY0Fa?=
 =?us-ascii?Q?UUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
x-dg-reftwo: 
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQmtBR3dBY0FC?=
 =?us-ascii?Q?ZkFIUUFaUUJoQUcwQWN3QmZBRzhBYmdCbEFHUUFjZ0JwQUhZQVpRQmZBR1lB?=
 =?us-ascii?Q?YVFCc0FHVUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdVQWJRQmhBR2tBYkFCZkFHRUFaQUJr?=
 =?us-ascii?Q?QUhJQVpRQnpBSE1BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFiUUJoQUhJQWRnQmxBR3dBYkFCZkFIQUFjZ0J2QUdvQVpRQmpB?=
 =?us-ascii?Q?SFFBWHdCakFHOEFaQUJsQUhNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCdEFHRUFj?=
 =?us-ascii?Q?Z0IyQUdVQWJBQnNBRjhBZEFCbEFISUFiUUJwQUc0QWRRQnpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQSIvPjwvbWV0YT4=3D?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4785:EE_|DM8PR18MB4440:EE_
x-ms-office365-filtering-correlation-id: edf6aebd-0248-4aca-c4d2-08db16c716b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qfPl6hPjAXe2G3GwNGrN2U7GaYJy4EkClGahn5/Q/W3Iuc33v2hWXzyKQBT0lL4Qd7jrQc4ReUFx/UxSGn2DyuPx+m6MnbEiBNOoNJYoG0Aq9PNgWEmCNvH8Kjo8mPGyEFiQbWy+XXL+oj1E256UqUvRwnSJeKWCIK80DQdJGLyvdZwF7DEUW15vW0Z4qSxPyJ31V2GTAHMPon4Fko+qJMUmsGI/kX4uqDtgJm+vHxXkdUdhRK/tANB0lNrF6dhNc0y/CYB2MeO2VSfBuqjptnNXvY9G8GNbEroTciHgJh7YjQd1ABPDeqB0FBjTg6TkCbil7tB0TuuPrHsIbAicE+D+YeeTtEhFASgLZ9BZrBgX7ekPvKsa6fmzNoVop8qkp0pG1eHkA95YGlkbwK1glwqlnFnsAxvhcpZlvhkkwdVOo/NqjkpNwR/pfWL6mLlLnjAoR1aQLPBBSUcOL2YBJ7QLsCOG9kBSIQz/glpKbwZrbIzKNXkkVNpwgGQLHgDaSeqrBNKX0tNwUwwsteTyh8VIVuFPdM6WdkfEmnFBOIVOay1V+TywCmZVLC5H7Hi9s3IpRYvN5IVXvblYrU1wGtLgWj7g1A9FayXmJLuvSlh2Umpf9Z1nLkmc9GxsJHLyNnst0RYngOP+e1Jl+0bZ/Q7f6L5Dmhl9rHGaS9MVdrjOWLQxhdwDWem4oLG+Xxer
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4785.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199018)(41300700001)(83380400001)(9686003)(5660300002)(478600001)(6916009)(8936002)(4326008)(38070700005)(38100700002)(26005)(186003)(86362001)(52536014)(4744005)(8676002)(55016003)(66946007)(76116006)(6506007)(33656002)(122000001)(66556008)(316002)(66446008)(66476007)(64756008)(966005)(71200400001)(2906002)(7696005)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6cSAK429IUV6SsO7Xs+3vzmV7co6pdp20LFZ6RAGSZcj3ELJUu6pJXQgL7OB?=
 =?us-ascii?Q?P5u2MtXiqT4K1tq3NzPZKf/DmhfulV7P3HUhToDrpgPYGrXWiPVMWx9bWQ+N?=
 =?us-ascii?Q?/8uhi1t09exqzTx8tjcw0+xTR8E8SbgbIzkG2VA9Kk7KmdwyhGj96iF8+CAF?=
 =?us-ascii?Q?2L7tEteUFVdgqJqDofWi++cuK3PCQm2FLAFrF7jChzLpednGMfYIUh+t5caS?=
 =?us-ascii?Q?7VloBnzisQvKtzRQTxk/xut1ZlByuxNK/CV1Goji7ODS479SiYuCT9JEaaZD?=
 =?us-ascii?Q?UV9JvdwVGBfy4B/+dkLixqf4vt5a5GJK86laqWIJqRkH77EKaaBsH2TJRyZQ?=
 =?us-ascii?Q?KYYcR+n7hGqSiEcvFF2QLNCrv/3fbcmxSdXwCFmRXI8uZpRmdrYNI3fHnsyA?=
 =?us-ascii?Q?niQeiI4fh9ZwNryuv1qpLepIfXwlKJUBWXlgXVwsHj/kxuptqWBUbTrbb8yg?=
 =?us-ascii?Q?msNKJuvMA7ESIVush8VDv6BSUY30ow6M1lvWVJ6/hyPlesuvhgxQce9owxLx?=
 =?us-ascii?Q?OJR+60p0RujdrQaInkP1uWjCTbfKsAtJzy7Eq3TZcFMJJacCQW2YAw8Ntu3/?=
 =?us-ascii?Q?i0mNEgkV73DudP4J668NStLvUxDug/9TqqJoVPtL8xmXcm5IB4beKg0ext18?=
 =?us-ascii?Q?AEKN9knjVvLSJWHv1i03vEx2QzDbrbAiiLUTCc38zALSuDPZ1VgQNL7XxCtV?=
 =?us-ascii?Q?s8Ja68/kDQ9IiGBFT40Cr2fyDyH2HmWV+/QI+kMzuEsZEIkHRkEgNYOP4Kmk?=
 =?us-ascii?Q?u+PR0lGT7EN5gZC/rCV/0J+Z+ATbuMT+ImKEmxCiIK/mUjEvMxtqdVfrMglA?=
 =?us-ascii?Q?vxaYt4XNP8YPeGuxnPHV83f/+5tNys/5o4n1oMclGtlxHgL0yMDst1bvOneu?=
 =?us-ascii?Q?XyHpSwqnuiY5y54ODi1/fLifvEc9LPdtf1FgtV2labyvpZZuw4yRoNPKBz4+?=
 =?us-ascii?Q?gwphQLm6aZY9Wy/vnO41/VyMm8eGpdBcT/qr3n9TOTAZ+Kfbt/GnTwsT3xGO?=
 =?us-ascii?Q?nlcUf5uymoTokSRfSyb/kxAfRlargabNJKS/AaHj2VYt9bXkUSIicY2TZs+Y?=
 =?us-ascii?Q?/uFjdNJkZKrCn2gtvwANTAtX3LyqM5C0OdF2JGbhQSNqR/Lt4FToXLofyxfx?=
 =?us-ascii?Q?mxOBRbi+xNbivkCYhz8oiMWY/qzLOReaGEiNP7joLwmKh1EdQJ7GObPXOMyy?=
 =?us-ascii?Q?X8QevKHuX1FpMuLVM5qHvVGSM/zr+44uJYmyp1b9uQjfI4cV4Es8rg0JVB2M?=
 =?us-ascii?Q?g+Dw4pbx6jCurf7uY+yoThkZCcSibhmiQpCDoMAwtnxdKb/KoLZkR8K4Wk1d?=
 =?us-ascii?Q?AAi7LS60rL2NBQw8sYxUIsUvfxIoaVaTbKZ1/2gWd4hIVXZZdnlYrjAEUugL?=
 =?us-ascii?Q?ON8+WXTaHxD4i6An9nNOtxGNGvgAqtYOsCvPPvgxeSao1nvaiP20+tsCG+mK?=
 =?us-ascii?Q?31VKk7IT4lX6HfPkBljcImoO6wRPU2e7m1seByL/3zGdLlEyGBzMGpfDYJS8?=
 =?us-ascii?Q?FpjGHpuQM3GuI/ZidAyyToVZB1uSPk4WpgbwboHGuAunEh4K3J1CXdEgLxKC?=
 =?us-ascii?Q?AsKkgPttGGkbJlXh379UtJZyVQEvz6bbyEXSBWFv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4785.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf6aebd-0248-4aca-c4d2-08db16c716b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2023 00:27:33.7796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4wFS6+7L3dF/XyztEONa5aPKw55oeyXt4kGk4JZrCj46IFJf1M40NJsoLFZ7otSn/SgN/pDhs1mdf54ezj5w1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR18MB4440
X-Proofpoint-ORIG-GUID: 0B5REliFYZJx8QPvm0SYtoLOM6gqzrZb
X-Proofpoint-GUID: 0B5REliFYZJx8QPvm0SYtoLOM6gqzrZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_18,2023-02-24_01,2023-02-09_01

Hi,

We would like to remove one firmware binary from this repository per our se=
curity team's concerns (Cavium was acquired by Marvell).

Thanks,
Derek
--
The following changes since commit 83f1d7781300b52785c062a8285da59042c0d1ff=
:

  Merge branch 'ath10k-20230215' of git://git.kernel.org/pub/scm/linux/kern=
el/git/kvalo/linux-firmware (2023-02-15 14:27:03 -0500)

are available in the git repository at:


  https://github.com/dchickles/linux-firmware.git liquidio-20230222

for you to fetch changes up to c6008409440f18da7109e20a3f8db0c6c0a0586b:

  liquidio: remove lio_23xx_vsw.bin (2023-02-22 18:48:26 -0800)

----------------------------------------------------------------
Chickles, Derek (1):
      liquidio: remove lio_23xx_vsw.bin

 LICENCE.cavium_liquidio   | 361 ------------------------------------------=
------------------------------------------------------
 WHENCE                    |   3 -
 liquidio/lio_23xx_vsw.bin | Bin 20434408 -> 0 bytes
 3 files changed, 364 deletions(-)
 delete mode 100644 liquidio/lio_23xx_vsw.bin
